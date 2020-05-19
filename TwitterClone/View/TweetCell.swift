//
//  TweetCell.swift
//  TwitterClone
//
//  Created by MCT on 18.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

class TweetCell : UICollectionViewCell{
    
    //MARK: - Properties
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.backgroundColor = .twitterBlue
        iv.setDimensions(width: 48, height: 48)
        iv.layer.cornerRadius = 48/2
        return iv
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.text = "selam"
        return label
    }()
    
    private let infoLabel = UILabel()
    
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selecttors
    
    //MARK: - Helpers
    
    
    func configureUI(){
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor,
                                paddingTop: 12, paddingLeft: 12)
        
        infoLabel.text = "selam2"
        
        let stack = UIStackView(arrangedSubviews: [infoLabel,captionLabel])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 4
    
        addSubview(stack)
        stack.anchor(top: profileImageView.topAnchor, left: profileImageView.rightAnchor,
                     right: rightAnchor, paddingLeft: 12, paddingRight: 12)
        
        
        let underLine = UIView()
        underLine.backgroundColor = .systemGroupedBackground
        addSubview(underLine)
        underLine.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 1)
        
        
    }
    
    
}
