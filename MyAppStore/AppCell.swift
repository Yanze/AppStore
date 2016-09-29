//
//  AppCell.swift
//  MyAppStore
//
//  Created by yanze on 9/29/16.
//  Copyright © 2016 yanzeliu. All rights reserved.
//

import UIKit

class AppCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
     func setupViews() {
        backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
