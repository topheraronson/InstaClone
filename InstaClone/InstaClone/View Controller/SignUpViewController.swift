//
//  SignUpViewController.swift
//  InstaClone
//
//  Created by Christopher Aronson on 7/19/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Properties
    
    var isProfileSelected = false
    
    let addPhotoButton: UIButton = {
        
        let button = UIButton(type: .system)
        
        button.setImage(#imageLiteral(resourceName: "avatar").withRenderingMode(.alwaysTemplate), for: .normal)
        button.addTarget(self, action: #selector(addPhotoButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    let nameTextField: UITextField = {
        
        let tf = UITextField()
        tf.placeholder = "Full Name"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(formValidator), for: .editingChanged)
        
        return tf
    }()
    
    let emailTextField: UITextField = {
        
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.keyboardType = .emailAddress
        
        tf.addTarget(self, action: #selector(formValidator), for: .editingChanged)
        
        return tf
    }()
    
    let usernameTextField: UITextField = {
        
        let tf = UITextField()
        tf.placeholder = "Username"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(formValidator), for: .editingChanged)
        
        return tf
    }()
    
    let passwordTextField: UITextField = {
        
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.isSecureTextEntry = true
        
        tf.addTarget(self, action: #selector(formValidator), for: .editingChanged)
        
        return tf
    }()
    
    let signUpButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
       
        button.backgroundColor = UIColor(red:0.12, green:0.57, blue:0.87, alpha:0.5)
        button.layer.cornerRadius = 5
        button.isEnabled = false
        
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        
        
        return button
    }()
    
    let haveAcountButton: UIButton = {
        
        let button = UIButton(type: .system)
        
        let attributes = NSMutableAttributedString(string: "Already have an acount?  ",
                                                   attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
                                                                NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributes.append(NSMutableAttributedString(string: "Sign In",
                                                    attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),
                                                                 NSAttributedString.Key.foregroundColor: UIColor(red:0.12,
                                                                                                                 green:0.57,
                                                                                                                 blue:0.87,
                                                                                                                 alpha:1.0)]))
        
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
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else { return }
        
        addPhotoButton.layer.cornerRadius = addPhotoButton.frame.height / 2
        addPhotoButton.layer.borderColor = UIColor.black.cgColor
        addPhotoButton.layer.borderWidth = 2
        
        addPhotoButton.clipsToBounds = true
        addPhotoButton.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        
        isProfileSelected = true
        
        dismiss(animated: true) {
            self.formValidator()
        }
    }
    
    private func configureView() {
        
        view.addSubview(addPhotoButton)
        addPhotoButton.anchor(top: view.topAnchor,
                              left: nil,
                              bottom: nil,
                              right: nil,
                              paddingTop: 75,
                              paddingLeft: 0,
                              paddingRight: 0,
                              paddingBottom: 0,
                              width: 100,
                              height: 100)
        
        addPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let stackview = UIStackView(arrangedSubviews: [nameTextField,
                                                       emailTextField,
                                                       usernameTextField,
                                                       passwordTextField,
                                                       signUpButton])
        stackview.axis = .vertical
        stackview.spacing = 16
        stackview.distribution = .fillEqually

        view.addSubview(stackview)
        stackview.anchor(top: addPhotoButton.bottomAnchor,
                         left: view.leftAnchor,
                         bottom: nil,
                         right: view.rightAnchor,
                         paddingTop: 40,
                         paddingLeft: 24,
                         paddingRight: 24,
                         paddingBottom: 0,
                         width: 0,
                         height: 240)

        view.addSubview(haveAcountButton)
        haveAcountButton.anchor(top: nil,
                                left: view.leftAnchor,
                                bottom: view.bottomAnchor,
                                right: view.rightAnchor,
                                paddingTop: 0,
                                paddingLeft: 0,
                                paddingRight: 0,
                                paddingBottom: 24,
                                width: 0,
                                height: 50)
        
    }
    
    @objc func signUpButtonTapped() {
        
        guard let email = emailTextField.text,
        let password = passwordTextField.text,
        let username = usernameTextField.text,
        let name = nameTextField.text
        else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print("\n\n\n\nError creating user: \(error) \n\n\n\n\n")
                return
            }
            
            guard let image = self.addPhotoButton.imageView?.image,
            let imageData = image.jpegData(compressionQuality: 0.3)
            else { return }
            
            let imageName = UUID().uuidString
            let storage = Storage.storage().reference().child("profile_images").child(imageName)
            
            storage.putData(imageData, metadata: nil, completion: { (metaData, error) in
                
                if let error = error {
                    print("\n\n\n\n\nCould not upload image: \(error) \n\n\n\n\n")
                    return
                }
                
                guard let metaData = metaData else {
                    print("\n\n\n\n\nproblem with metadata returned from server\n\n\n\n\n")
                    return
                }
                
                storage.downloadURL(completion: { (url, error) in
                    
                    if let error = error {
                        print("\n\n\n\n\nCould not get profile image url: \(error) \n\n\n\n\n")
                        return
                    }
                    
                    guard let url = url,
                    let uid = result?.user.uid
                    else { return }
                    
                    let userInfo = ["full_name": name,
                                    "email": email,
                                    "username": username,
                                    "profile_image_url": url.absoluteString]
                    
                    let json = [uid: userInfo]
                    
                    let db = Database.database().reference().child("users")
                    
                    db.updateChildValues(json, withCompletionBlock: { (error, reference) in
                        
                        if let error = error {
                            print("\n\n\n\n\nproblem with uploadeding user json to server: \(error) \n\n\n\n\n")
                            return
                        }
                        
                        print("\n\n\n\n\nSuccessfully uploaded user!!\n\n\n\n\n")
                    })
                })
                
            })
        }
        
    }
    
    @objc func haveAcountButtonTapped() {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func formValidator() {
        
        guard emailTextField.hasText,
        passwordTextField.hasText,
        nameTextField.hasText,
        usernameTextField.hasText,
        isProfileSelected == true
        else {
            
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = UIColor(red:0.12, green:0.57, blue:0.87, alpha:0.5)
            
            return
        }
        
        signUpButton.isEnabled = true
        signUpButton.backgroundColor = UIColor(red:0.12, green:0.57, blue:0.87, alpha:1.0)
    }
    
    @objc func addPhotoButtonTapped() {
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true)
        
    }

}
