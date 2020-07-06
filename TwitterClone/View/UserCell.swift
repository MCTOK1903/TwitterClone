//
//  UserCell.swift
//  TwitterClone
//
//  Created by MCT on 6.07.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    //MARK: - Properties
    
    private lazy var profileImageView: UIImageView = {
           let iv = UIImageView()
           iv.contentMode = .scaleToFill
           iv.clipsToBounds = true
           iv.backgroundColor = .twitterBlue
           iv.setDimensions(width: 40, height: 40)
           iv.layer.cornerRadius = 40/2
           
           return iv
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Username"
        return label
    }()
    
    private let fullNameLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.systemFont(ofSize: 14)
           label.text = "Fullname"
           return label
    }()
    
    //MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(profileImageView)
        profileImageView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
        let stack = UIStackView(arrangedSubviews: [userNameLabel,fullNameLabel])
        stack.axis = .vertical
        stack.spacing = 2
        
        addSubview(stack)
        stack.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


