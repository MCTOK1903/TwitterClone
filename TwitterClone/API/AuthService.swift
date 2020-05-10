//
//  AuthService.swift
//  TwitterClone
//
//  Created by MCT on 10.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}


struct AuthService {
    
    static let shared = AuthService()
    
    func logUserIn(email: String, password:String, comletion: AuthDataResultCallback?){
        
        Auth.auth().signIn(withEmail: email, password: password, completion: comletion)
        
        
    }
    
    
    //MARK: - registerUeer
    func registerUser(credentials: AuthCredentials, completion: @escaping (Error?, DatabaseReference) -> Void){
        let email = credentials.email
        let password = credentials.password
        let fullname = credentials.fullname
        let username = credentials.username
        let profilImage = credentials.profileImage
        
        
        guard let imageData = profilImage.jpegData(compressionQuality: 0.3) else {return}
        let imageDataName = UUID().uuidString
        let storeRef = STORE_PROFILE_IMAGES.child(imageDataName)
        
        //MARK:  upload image to FirebaseStore
        storeRef.putData(imageData, metadata: nil) { (metadata, error) in
            storeRef.downloadURL { (url, error) in
                guard let profileImageUrl = url?.absoluteString else {return}
                
                Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                    if let err = err {
                        print("\(err.localizedDescription)")
                        return
                    }
                    guard let uid = result?.user.uid else {return}
                    
                    //MARK:  upload userInfo to database
                    let userValue = ["email":email,
                                     "username":username,
                                     "fullname":fullname,
                                     "profileImageUrl":profileImageUrl]
                    
                    REF_USERS.child(uid).updateChildValues(userValue, withCompletionBlock: completion)
                }
            }
        }
        
        
        
    }
}


