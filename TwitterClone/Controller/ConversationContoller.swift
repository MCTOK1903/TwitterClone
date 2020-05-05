//
//  ConversationContoller.swift
//  TwitterClone
//
//  Created by MCT on 5.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

class ConversationContoller: UIViewController {
    
    //MARK: - Properties
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        navigationItem.title = "Messages"
    }
    
    
    
}
