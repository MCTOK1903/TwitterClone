//
//  Tweet.swift
//  TwitterClone
//
//  Created by MCT on 18.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation


struct Tweet {
    let caption: String
    let likes: String
    let retweets: String
    var timestamp: Date!
    let tweetId: String
    let uid: String
    
    
    init(tweetId:String, dictionary: [String:Any]) {
        self.tweetId = tweetId
        
        self.caption = dictionary["caption"] as? String ?? ""
        self.likes = dictionary["likes"] as? String ?? ""
        self.retweets = dictionary["retwwets"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        
        if let timestamp = dictionary["timestamp"] as? Double {
            self.timestamp = Date(timeIntervalSince1970: timestamp)
        }
        
    }
    
}
