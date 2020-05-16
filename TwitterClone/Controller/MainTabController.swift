//
//  MainTabController.swift
//  TwitterClone
//
//  Created by MCT on 5.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {
    
    //MARK: - Properties
    
    var user: User? {
        didSet {
            //!
            guard let nav = viewControllers?[0] as? UINavigationController else {return}
            guard let feed = nav.viewControllers.first as? FeedController else {return}
            feed.user = self.user
        }
    }
    
    let actionButton : UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(addNewTweetTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //x()
        
        configureViewContoller()
        configureUI()
        fetchUser()
    }
    
    //MARK: - !!!
    func x(){
        
        do {
            try Auth.auth().signOut()
        }catch let error{
            print(error)
        }
    }
    
    //MARK: - API
    
    func fetchUser(){
        UserService.shared.fetchUser { (user) in
            self.user = user
        }
    }

    
    
    //MARK: - addNewTweet Button Action 
    
    @objc func addNewTweetTapped(){
        guard let user = user else {return}
        let uploadTweetController = UploadTweetController(user: user)
        let nav = UINavigationController(rootViewController: uploadTweetController)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
        
    }
    
    
    
    
    //MARK: - Helpers
    
    func configureUI(){
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56/2        
    }
    
    
    
    func configureViewContoller(){
        
        let feed = FeedController()
        let feedNavigation = templateNavigationController(image:UIImage(named: "home_unselected"), rootViewController: feed)
        
        let explore = ExploreController()
        let exploreNavigation = templateNavigationController(image: UIImage(named: "search_unselected"), rootViewController: explore)
        
        let notifications = NotificationsContoller()
        let notificationNavigation = templateNavigationController(image: UIImage(named: "like_unselected"), rootViewController: notifications)
        
        let conversations = ConversationContoller()
        let conversationsNavigation = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: conversations)
         
        // configure tabbar
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
