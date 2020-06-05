//
//  Constants.swift
//  TwitterClone
//
//  Created by MCT on 10.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Firebase

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let REF_TWEETS = DB_REF.child("tweets")
let REF_USER_TWEETS = DB_REF.child("user-tweets")

let STORE_REF = Storage.storage().reference()
let STORE_PROFILE_IMAGES = STORE_REF.child("profile_images")

