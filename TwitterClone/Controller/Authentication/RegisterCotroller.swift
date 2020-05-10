//
//  RegisterCotroller.swift
//  TwitterClone
//
//  Created by MCT on 9.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit
import Firebase

class RegisterController: UIViewController{
    
    //MARK: - Properties
    
    private let imagePicker = UIImagePickerController()
    private var profileImage : UIImage?
    
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
        tf.isSecureTextEntry = true
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
    
    
    
    
    
    //MARK: - lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        configureUI()
    }
    
    
    
    //MARK: - Selectors
    
    @objc func alreadyHaveAccountTapped(){
        navigationController?.pushViewController(LoginController(), animated: true)
    }
    
    @objc func plusPhotoTapped(){
        
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @objc func SignUpTapped(){
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        guard let fullname = fullNameTextField.text else {return}
        guard let username = userNameTextField.text else {return}
        
        guard let imageData = profileImage?.jpegData(compressionQuality: 0.3) else {return}
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
                    
                    REF_USERS.child(uid).updateChildValues(userValue) { (error, ref) in
                        if error != nil {
                            return
                        }
                        print("success")
                    }
                    
                }
                
                
            }
        }
        
        
        
        
    }
    
    
    
    //MARK: - ConfigureUI
    
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

//MARK: - UIImagePickerControllerDelegate extension

extension RegisterController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let profileImage = info[.originalImage] as? UIImage else {return}
        self.profileImage = profileImage
        
        // set the radius of the photo
        plusPhotoButton.layer.cornerRadius = 128/2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.imageView?.contentMode = .scaleAspectFill
        plusPhotoButton.imageView?.clipsToBounds = true
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.layer.borderWidth = 3
        
        self.plusPhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
