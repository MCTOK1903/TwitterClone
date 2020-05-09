//
//  RegisterCotroller.swift
//  TwitterClone
//
//  Created by MCT on 9.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

class RegisterController: UIViewController{
    
    //MARK: -Properties
    
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(plusPhotoTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var emailContainerView: UIView = {
        let iv = #imageLiteral(resourceName: "ic_mail_outline_white_2x-1")
        let view = Utilities().inputContainerView(withImage: iv, textField: emailTextField)
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let iv = #imageLiteral(resourceName: "ic_lock_outline_white_2x")
        let view = Utilities().inputContainerView(withImage: iv, textField: passwordTextField)
        return view
    }()
    
    private lazy var fullNameContainerView: UIView = {
        let iv = #imageLiteral(resourceName: "ic_person_outline_white_2x")
        let view = Utilities().inputContainerView(withImage: iv, textField: fullNameTextField)
        return view
    }()
    
    private lazy var userNameContainerView: UIView = {
        let iv = #imageLiteral(resourceName: "ic_person_outline_white_2x")
        let view = Utilities().inputContainerView(withImage: iv, textField: userNameTextField)
        return view
    }()
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = Utilities().attributedButton("Already have an account? ", "Log In")
        button.addTarget(self, action: #selector(alreadyHaveAccountTapped), for: .touchUpInside)
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(SignUpTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    
    private let emailTextField: UITextField = {
        let tf = Utilities().createTextField(withPlaceHolder: "Email")
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = Utilities().createTextField(withPlaceHolder: "Password")
        return tf
    }()
    
    private let fullNameTextField: UITextField = {
        let tf = Utilities().createTextField(withPlaceHolder: "Full Name")
        return tf
    }()
    
    private let userNameTextField: UITextField = {
        let tf = Utilities().createTextField(withPlaceHolder: "Username")
        return tf
    }()
    
    
    
    
    
    //MARK: -lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    
    //MARK: -Selectors
    
    @objc func alreadyHaveAccountTapped(){
        navigationController?.pushViewController(LoginController(), animated: true)
    }
    
    @objc func plusPhotoTapped(){
        
    }
    
    @objc func SignUpTapped(){
        
    }
    
    
    
    //MARK: -Helpers
    
    func configureUI(){
        view.backgroundColor = .twitterBlue
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        plusPhotoButton.setDimensions(width: 128, height: 128)
        
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView,fullNameContainerView,userNameContainerView,signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        
        stack.anchor(top: plusPhotoButton.bottomAnchor , left: view.leftAnchor , right:  view.rightAnchor,paddingTop: 32 ,paddingLeft: 32, paddingRight: 32 )
        
        
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(left:view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right:view.rightAnchor, paddingLeft: 40, paddingBottom: 8, paddingRight: 40)
        
    }
    
    
    
}
