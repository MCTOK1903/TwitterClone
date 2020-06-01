//
//  ProfileHeaderViewModel.swift
//  TwitterClone
//
//  Created by MCT on 1.06.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation

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
