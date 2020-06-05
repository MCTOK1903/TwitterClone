//
//  ProfileHeaderViewModel.swift
//  TwitterClone
//
//  Created by MCT on 1.06.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

enum ProfileFilterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var description: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Tweets & Replies"
        case .likes: return "Likes"
        }
    }
}

struct ProfuleHeaderViewModel {
    
    private let user: User
    
    var usernametext: String
    
    var followersString: NSAttributedString? {
        return attributedText(withValue: 0, text: " Followers")
    }
    
    var followingString: NSAttributedString? {
        return attributedText(withValue: 2, text: " Following")
    }
    
    var actionButtonTitle: String {
        if user.isCurrentUser {
            return "Edit Profile"
        }else {
            return "Follow"
        }
    }
    
    init(user: User){
        self.user = user
        self.usernametext = "@" + user.username
    }
    
    fileprivate func attributedText(withValue value: Int, text: String) -> NSAttributedString {
        
        let attributedTitle = NSMutableAttributedString(string: "\(value)",
            attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
        
        attributedTitle.append(NSAttributedString(string: "\(text)",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
                         NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        
        return attributedTitle
    }
    
    
}
