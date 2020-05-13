//
//  UserService.swift
//  TwitterClone
//
//  Created by MCT on 13.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Firebase


struct UserService {
    
     static let shared = UserService()
    
    func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
        }
    }
    
}
