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
    
    private let filterBar = ProfileFilterView()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "baseline_arrow_back_white_24dp"), for: .normal)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    private lazy var containerview: UIView = {
        let view = UIView()
        
        view.backgroundColor = .twitterBlue
        view.addSubview(backButton)
        backButton.anchor(top:view.topAnchor, left: view.leftAnchor, paddingTop: 42, paddingLeft: 16)
        backButton.setDimensions(width: 30, height: 30)
        return view
    }()
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 4
        
        return iv
    }()
    
    private lazy var editProfileFollowButton : UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("loading", for: .normal)
        button.layer.borderColor = UIColor.twitterBlue.cgColor
        button.layer.borderWidth = 1.25
        button.setTitleColor(.twitterBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleEditProfileFollow), for: .touchUpInside)
        
        return button
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "deneme 1"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "@deneme 1"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        
        label.text = "deneme 1"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 3
        label.text = "heyyo suprise m f "
        
        return label
    }()
    
    private let underline: UIView = {
        let view  = UIView()
        view.backgroundColor = .twitterBlue
        return view
    }()
    
    
    
   
    
    
    //MARK: - lifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        filterBar.delegate = self
        
        addSubview(containerview)
        containerview.anchor(top:topAnchor, left: leftAnchor,right: rightAnchor, height: frame.height * 0.40)
        
        addSubview(profileImageView)
        profileImageView.anchor(top:containerview.bottomAnchor, left: leftAnchor,
                                paddingTop: -24, paddingLeft: 8)
        profileImageView.setDimensions(width: 80, height: 80)
        profileImageView.layer.cornerRadius = 80 / 2
        
        addSubview(editProfileFollowButton)
        editProfileFollowButton.anchor(top: containerview.bottomAnchor, right: rightAnchor,
                                       paddingTop: 12, paddingRight: 12)
        editProfileFollowButton.setDimensions(width: 100, height: 36)
        editProfileFollowButton.layer.cornerRadius = 36 / 2
        
        let userInfoStack = UIStackView(arrangedSubviews: [fullNameLabel,
                                                           userNameLabel,
                                                           bioLabel])
        userInfoStack.axis = .vertical
        userInfoStack.distribution = .fillProportionally
        userInfoStack.spacing = 4
        
        addSubview(userInfoStack)
        userInfoStack.anchor(top:profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor,
                             paddingTop: 8, paddingLeft: 12, paddingRight: 12)
        
        addSubview(filterBar)
        filterBar.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 35)
        filterBar.backgroundColor = .white
        
        addSubview(underline)
        let count = CGFloat(ProfileFilterOptions.allCases.count)
        underline.anchor(left:leftAnchor, bottom: bottomAnchor, width: frame.width / count, height: 3)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Selector
    
    @objc func handleDismissal(){
        print(frame.width)
        print(frame.height)
    }
    
    @objc func handleEditProfileFollow(){
    }
}

//MARK: -  ProfileFilterViewDelegate

extension ProfileHeader: ProfileFilterViewDelegate {
    func filterView(_ view: ProfileFilterView, didSelect indexPath: IndexPath) {
        guard let cell = view.collectionView.cellForItem(at: indexPath) as? ProfileFilterCell else {return}
        
        let xPostion = cell.frame.origin.x
        UIView.animate(withDuration: 0.3) {
            self.underline.frame.origin.x = xPostion
        }
        
    }
}
