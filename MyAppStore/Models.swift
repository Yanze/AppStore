//
//  Models.swift
//  MyAppStore
//
//  Created by yanze on 9/30/16.
//  Copyright © 2016 yanzeliu. All rights reserved.
//

import UIKit

class AppCategory: NSObject {
    var name: String?
    var apps: [App]?
    
    static func fetchFeaturedApps()  {
        let urlString = "http://www.statsallday.com/appstore/featured"
//        let urlString = "https://api.github.com/users/yanze"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: urlString)
        
        let task = session.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            else {
                do {
                    if let json = try JSONSerialization .jsonObject(with: data!, options: .allowFragments) as? [String: Any] {
                        print(json)
                    }
                } catch {
                    print("error")
                }
            }
        })
        task.resume()
    }
    
    
    
    
    static func sampleAppCategories() ->[AppCategory] {
        let bestNewAppsCategory = AppCategory()
        bestNewAppsCategory.name = "Best New Apps"
        
        var bestApps = [App]()
        let frozenApp = App()
        frozenApp.name = "Disney build: Frozen"
        frozenApp.category = "Entertaiment"
        frozenApp.imageName = "frozen"
        frozenApp.price = NSNumber(value: 3.99)
        bestApps.append(frozenApp)
        bestNewAppsCategory.apps = bestApps
        
        
        
        let bestNewGameCategory = AppCategory()
        bestNewGameCategory.name = "Best New Games"
        var bestGames = [App]()
        
        let telepaintGame = App()
        telepaintGame.name = "Telepaint"
        telepaintGame.category = "Games"
        telepaintGame.imageName = "telepaint"
        telepaintGame.price = NSNumber(value: 2.99)
        bestGames.append(telepaintGame)
        bestNewGameCategory.apps = bestGames
        
        
        return [bestNewAppsCategory, bestNewGameCategory]
    }
}

class App: NSObject {
    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
    var price: NSNumber?
}
