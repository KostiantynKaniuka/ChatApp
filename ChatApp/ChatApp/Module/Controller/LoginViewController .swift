//
//  LoginViewController .swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 08.02.2023.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Properties
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "HEY, WELCOME"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private let profileImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "profile")
        iv.contentMode = .scaleAspectFit
        iv.setDimensions(height: 50, width: 50)
        return iv
    }()
    
    private let emailTextField: UITextField = {
       let tf = UITextField()
        tf.textColor = .black
        tf.setHeight(50)
        tf.placeholder = "Email"
        tf.backgroundColor = .lightGray
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    private let passwordTextField: UITextField = {
       let tf = UITextField()
        tf.textColor = .black
        tf.setHeight(50)
        tf.placeholder = "Password"
        tf.backgroundColor = .lightGray
        tf.isSecureTextEntry = true
        return tf
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
      
        configureUI()
    }
    
    //MARK: - Helpers
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(welcomeLabel)
        view.addSubview(profileImage)
        welcomeLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        welcomeLabel.centerX(inView: view)
        
        profileImage.anchor(top: welcomeLabel.bottomAnchor, paddingTop: 20)
        profileImage.centerX(inView: view)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.anchor(top: profileImage.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 30,
                         paddingLeft: 30,
                         paddingRight: 30)
    }
}
