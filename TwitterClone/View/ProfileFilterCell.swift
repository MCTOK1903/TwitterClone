//
//  ProfileFilterCell.swift
//  TwitterClone
//
//  Created by MCT on 24.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

class ProfileFilterCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    let titleLable: UILabel = {
        let label = UILabel()
        
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Test Text"
        
        return label
    }()
    
    override var isSelected: Bool{
        didSet {
            titleLable.font = isSelected ? UIFont.boldSystemFont(ofSize: 16) : UIFont.systemFont(ofSize: 14)
            titleLable.textColor = isSelected ? .twitterBlue : .lightGray
        }
    }
    //MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(titleLable)
        titleLable.center(inView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
