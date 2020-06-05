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
        
        let ref = REF_TWEETS.childByAutoId()
        
        ref.updateChildValues(values) { (error, ref) in
            guard let TweetID = ref.key else { return }
            REF_USER_TWEETS.child(uid).updateChildValues([TweetID: 1], withCompletionBlock: completion)
        }
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
    
    //MARK: - FetchTweetsUser
    
    func fetchTweets(forUser user: User, completion: @escaping([Tweet])-> Void){
        
        var tweets = [Tweet]()
        
        REF_USER_TWEETS.child(user.uid).observe(.childAdded) {snapshot in
            let tweetID = snapshot.key
            
            REF_TWEETS.child(tweetID).observeSingleEvent(of: .value) {snapshot in
                guard let dictionary = snapshot.value as? [String:Any] else {return}
                guard let uid = dictionary["uid"] as? String else {return}
                
                UserService.shared.fetchUser(uid: uid) { user in
                    let tweet = Tweet(user: user, tweetId: tweetID, dictionary: dictionary)
                    tweets.append(tweet)
                    completion(tweets)
                }
            }
        }
        
    }
    
}
