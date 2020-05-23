//
//  TweetService.swift
//  TwitterClone
//
//  Created by MCT on 16.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Firebase

struct TweetService {
    
    static let shared = TweetService()
    
    
    //MARK: - Upload Tweet
    func uploadTweet(caption:String, completion: @escaping(Error?, DatabaseReference)->Void){
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let values = ["uid": uid,
                      "timestamp": Int(NSDate().timeIntervalSince1970),
                      "likes":0,
                      "retweets": 0 ,
                      "caption": caption] as [String: Any]
        
        REF_TWEETS.childByAutoId().updateChildValues(values, withCompletionBlock: completion)
    }
    
    
    //MARK: - FetchTweets
    
    func fetchTweets(completion: @escaping([Tweet])-> Void){
        
        var tweets = [Tweet]()
        
        REF_TWEETS.queryOrdered(byChild: "timestamp").observe(.childAdded) { (snapshot) in
            guard let dictionary = snapshot.value as? [String:Any] else {return}
            guard let uid = dictionary["uid"] as? String else {return}
            let tweetID = snapshot.key
            
            UserService.shared.fetchUser(uid: uid) { user in
                
                let tweet = Tweet(user: user, tweetId: tweetID, dictionary: dictionary)
                tweets.append(tweet)
                completion(tweets.reversed())
            }
        }
        
    }
}
