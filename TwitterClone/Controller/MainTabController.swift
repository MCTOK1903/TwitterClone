//
//  MainTabController.swift
//  TwitterClone
//
//  Created by MCT on 5.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

class MainTabController: UITabBarController {
    
    //MARK: - Properties
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        configureViewContoller()
    }
    
    //MARK: - Helpers
    
    func configureViewContoller(){
        
        let feed = FeedController()
        let feedNavigation = templateNavigationController(image:UIImage(named: "home_unselected"), rootViewController: feed)

        let explore = ExploreController()
        let exploreNavigation = templateNavigationController(image: UIImage(named: "search_unselected"), rootViewController: explore)
        
        let notifications = NotificationsContoller()
        let notificationNavigation = templateNavigationController(image: UIImage(named: "like_unselected"), rootViewController: notifications)
        
        let conversations = ConversationContoller()
        let conversationsNavigation = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: conversations)
         
        viewControllers = [feedNavigation,exploreNavigation,notificationNavigation,conversationsNavigation]
        
    }
    
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController)
        -> UINavigationController {
        
            let nav = UINavigationController(rootViewController: rootViewController)
            nav.tabBarItem.image = image
            nav.navigationBar.barTintColor = .white
            return nav
    }
       
    

    

}
