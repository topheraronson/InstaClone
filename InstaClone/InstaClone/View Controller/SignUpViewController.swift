//
//  SignUpViewController.swift
//  InstaClone
//
//  Created by Christopher Aronson on 7/19/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    // MARK: - Properties
    let addPhotoButton: UIButton = {
        
        let button = UIButton(type: .system)
        
        button.setImage(#imageLiteral(resourceName: "avatar").withRenderingMode(.alwaysTemplate), for: .normal)
        
        return button
    }()
    
    let nameTextField: UITextField = {
        
        let tf = UITextField()
        tf.placeholder = "Full Name"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    let emailTextField: UITextField = {
        
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    let usernameTextField: UITextField = {
        
        let tf = UITextField()
        tf.placeholder = "Username"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    let passwordTextField: UITextField = {
        
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    let signUpButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red:0.12, green:0.57, blue:0.87, alpha:1.0)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let haveAcountButton: UIButton = {
        
        let button = UIButton(type: .system)
        
        let attributes = NSMutableAttributedString(string: "Already have an acount?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributes.append(NSMutableAttributedString(string: "Sign In", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(red:0.12, green:0.57, blue:0.87, alpha:1.0)]))
        
        button.setAttributedTitle(attributes, for: .normal)
        button.addTarget(self, action: #selector(haveAcountButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - View Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureView()
    }
    
    private func configureView() {
        
        view.addSubview(addPhotoButton)
        addPhotoButton.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 75, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 100, height: 100)
        addPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let stackview = UIStackView(arrangedSubviews: [nameTextField, emailTextField, usernameTextField, passwordTextField, signUpButton])
        stackview.axis = .vertical
        stackview.spacing = 16
        stackview.distribution = .fillEqually

        view.addSubview(stackview)
        stackview.anchor(top: addPhotoButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 24, paddingRight: 24, paddingBottom: 0, width: 0, height: 240)

        view.addSubview(haveAcountButton)
        haveAcountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 24, width: 0, height: 50)
    }
    
    @objc func signUpButtonTapped() {
        print("Sign Up Button Tapped")
    }
    
    @objc func haveAcountButtonTapped() {
        
        navigationController?.popToRootViewController(animated: true)
    }

}
