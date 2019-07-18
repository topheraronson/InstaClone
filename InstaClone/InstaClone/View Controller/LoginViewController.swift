//
//  LoginViewController.swift
//  InstaClone
//
//  Created by Christopher Aronson on 7/17/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let emailTextField: UITextField = {
        
        let tf = UITextField()
        tf.placeholder = "Email"
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
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red:0.12, green:0.57, blue:0.87, alpha:1.0)
        button.layer.cornerRadius = 5
//        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureView()
    }
    
    func configureView() {
        
        let stackview = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stackview.axis = .vertical
        stackview.spacing = 16
        stackview.distribution = .fillEqually
        
        view.addSubview(stackview)
        stackview.anchor(top: view.topAnchor,
                         left: view.leftAnchor,
                         bottom: nil,
                         right: view.rightAnchor,
                         paddingTop: 40,
                         paddingLeft: 24,
                         paddingRight: 24,
                         paddingBottom: 0,
                         width: 0,
                         height: 140)
        
    }
    
    @objc func loginButtonTapped() {
        print("Login tapped")
    }

}
