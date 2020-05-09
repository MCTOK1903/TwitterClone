//
//  LoginController.swift
//  TwitterClone
//
//  Created by MCT on 9.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

class LoginController: UIViewController{
    
    //MARK: -Properties
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "TwitterLogo")
        return iv
    }()
    
    
    //MARK: -lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        configureUI()
    }
    
    
    
    //MARK: -Selectors
    
    //MARK: -ConfigureUI
    
    func configureUI(){
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true

        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 159, height: 150)
    }
    
    
    
}
