//
//  User.swift
//  TwitterClone
//
//  Created by MCT on 13.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation


struct User {
    let uid: String
    let email: String
    let fullname: String
    let username: String
    var profileImageUrl: URL?
    
    init(uid: String,dictionary: [String:Any]){
        self.uid = uid
        
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        
        if let profileImageURLString = dictionary["profileImageUrl"] as? String {
            guard let url = URL(string: profileImageURLString) else { return }
            self.profileImageUrl = url
        }
        
    }
}
