//
//  TweetCell.swift
//  TwitterClone
//
//  Created by MCT on 18.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

class TweetCell : UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
