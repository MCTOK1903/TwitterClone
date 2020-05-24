//
//  ProfileHeader.swift
//  TwitterClone
//
//  Created by MCT on 24.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    //MARK: - Properties
    
    
    //MARK: - lifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor =  .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
