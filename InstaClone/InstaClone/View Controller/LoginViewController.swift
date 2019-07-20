//
//  LoginViewController.swift
//  InstaClone
//
//  Created by Christopher Aronson on 7/17/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    let logoView: UIView = {
        
        let view = UIView()
        
        let logo = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white"))
        logo.contentMode = .scaleAspectFill
        
        view.addSubview(logo)
        logo.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 50)
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logo.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.backgroundColor = UIColor(red:0.12, green:0.57, blue:0.87, alpha:1.0)
        
        return view
    }()

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
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let dontHaveAcountButton: UIButton = {
        
        let button = UIButton(type: .system)
        
        let attributes = NSMutableAttributedString(string: "Don't have an acount?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributes.append(NSMutableAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(red:0.12, green:0.57, blue:0.87, alpha:1.0)]))

        button.setAttributedTitle(attributes, for: .normal)
        button.addTarget(self, action: #selector(dontHaveAcountButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - View Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        view.backgroundColor = .white
        configureView()
    }
    
    // MARK: - Private Functions
    private func configureView() {
        
        view.addSubview(logoView)
        logoView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 150)
        
        let stackview = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stackview.axis = .vertical
        stackview.spacing = 16
        stackview.distribution = .fillEqually
        
        view.addSubview(stackview)
        stackview.anchor(top: logoView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 24, paddingRight: 24, paddingBottom: 0, width: 0, height: 140)
        
        view.addSubview(dontHaveAcountButton)
        dontHaveAcountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 24, width: 0, height: 50)
    }
    
    
    // MARK: - Selector Functions
    @objc func loginButtonTapped() {
        print("Login tapped")
    }
    
    @objc func dontHaveAcountButtonTapped() {
        navigationController?.show(SignUpViewController(), sender: self)
    }

}
