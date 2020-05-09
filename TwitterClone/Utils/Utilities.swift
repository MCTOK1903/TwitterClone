//
//  Utilities.swift
//  TwitterClone
//
//  Created by MCT on 9.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

class Utilities {
    
    //MARK: - createContainerView
    func inputContainerView(withImage image:UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        let iv = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        iv.image = image
        view.addSubview(iv)
        iv.anchor(left:view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 8, paddingBottom: 8)
        iv.setDimensions(width: 24, height: 24)
        
        
        view.addSubview(textField)
        textField.anchor(left: iv.rightAnchor, bottom:  view.bottomAnchor, right: view.rightAnchor,
                         paddingLeft: 8, paddingBottom: 8)
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        view.addSubview(dividerView)
        dividerView.anchor(left:view.leftAnchor,bottom: view.bottomAnchor, right: view.rightAnchor,
                           paddingLeft: 8, height: 0.75)
        
        return view
    }
    //MARK: - create textField
    func createTextField(withPlaceHolder placeHolder: String) -> UITextField{
        let tf = UITextField()
        tf.textColor = .white
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return tf
    }
    
    //MARK: - attributedButton
    
    func attributedButton(_ firstPart:String, _ secondPart: String) -> UIButton{
        let button = UIButton(type: .system)
        
        let attributeTitle = NSMutableAttributedString(string: firstPart, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
        
        attributeTitle.append(NSMutableAttributedString(string: secondPart, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
        
        button.setAttributedTitle(attributeTitle, for: .normal)
        
        return button
    }
    
    
    //MARK: - createLogin/singUpButton
    
    
    
    
    
}
