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
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .black
        button.setHeight(50)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .boldSystemFont(ofSize: 19)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var forgetPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedText(firstString: "Forget your password?", secondString: "Get Help Signing in")
        button.setHeight(50)
        button.addTarget(self, action: #selector(handleForgetPassword), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var signUpdButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedText(firstString: "Don't have an account?", secondString: "Sign up")
        button.setHeight(50)
        button.addTarget(self, action: #selector(handleSignUpdButton), for: .touchUpInside)
        
        return button
    }()
    
    private let contLabel: UILabel = {
        let label = UILabel()
        label.text = "or continue with Google"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    private lazy var googleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Google", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .black
        button.setDimensions(height: 50, width: 150)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .boldSystemFont(ofSize: 19)
        button.addTarget(self, action: #selector(handleGoogleButton), for: .touchUpInside)
        
        return button
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
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, forgetPasswordButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.anchor(top: profileImage.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 30,
                         paddingLeft: 30,
                         paddingRight: 30)
        view.addSubview(signUpdButton)
        signUpdButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
        signUpdButton.centerX(inView: view)
        
        view.addSubview(contLabel)
        contLabel.centerX(inView: view, topAnchor: forgetPasswordButton.bottomAnchor, paddingTop: 30)
        view.addSubview(googleButton)
        googleButton.centerX(inView: view, topAnchor: contLabel.bottomAnchor, paddingTop: 12)
    }
    
    @objc private func handleLogin() {
        print("Login")
    }
    
    @objc private func handleForgetPassword() {
        print("OMAGAD")
    }
    
    @objc private func handleSignUpdButton() {
        print("GOGALLD")
    }
    
    @objc private func handleGoogleButton() {
        print("CARAMBA")
    }
}