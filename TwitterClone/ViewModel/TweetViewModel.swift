//
//  TweetViewModel.swift
//  TwitterClone
//
//  Created by MCT on 20.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

struct TweetViewModel {
    
    let tweet: Tweet
    let user: User
    
    var profileImageUrl: URL? {
        return user.profileImageUrl
    }
    
    var userInfoText: NSAttributedString {
        
        let title = NSMutableAttributedString(string: user.fullname, attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        
        title.append(NSAttributedString(string: " @\(user.username)",
            attributes: [.font: UIFont.boldSystemFont(ofSize: 14),
                         .foregroundColor: UIColor.lightGray ]))
        
        return title
    }
    
    init(tweet:Tweet) {
        self.tweet = tweet
        self.user = tweet.user
    }
}
