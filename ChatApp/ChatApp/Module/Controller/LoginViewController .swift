//
//  LoginViewController .swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 08.02.2023.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Properties
    var viewModel = LoginViewModel()
    private let welcomeLabel = CustomLabel(text: "HEY, WELCOME", labelFont: .boldSystemFont(ofSize: 20))
    private let emailTextField = CustomTextField(placeholder: "Email", keyboardType: .emailAddress)
    private let passwordTextField = CustomTextField(placeholder: "Password", isSecuredText: true)
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        
        return imageView
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        button.blackButton(buttonText: "Login")
        
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
    
    private let contLabel = CustomLabel(text: "or continue with Google", labelFont: .systemFont(ofSize: 14), color: .lightGray)
    
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
        configureForTextField()
    }
    
    //MARK: - Helpers
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(profileImage)
        view.addSubview(welcomeLabel)
        
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
    
    private func configureForTextField() {
        emailTextField.addTarget(self, action: #selector(handleTextChanget(sender:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(handleTextChanget(sender:)), for: .editingChanged)
    }
    
    @objc private func handleLogin() {
        guard let email = emailTextField.text?.lowercased() else { return }
        guard let password = passwordTextField.text?.lowercased() else { return }
        
        AuthServices.loginUser(withEmail: email, withPassword: password) { result, error in
            if let error = error {
                print("Error \(error.localizedDescription)")
                return
            }
            print("success login")
            self.navigateToConversation()
        }
    }
    
    @objc private func handleForgetPassword() {
        print("OMAGAD")
    }
    
    @objc private func handleSignUpdButton() {
        let controller = RegisterViewController()
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func handleGoogleButton() {
        print("CARAMBA")
    }
    
    @objc private func handleTextChanget(sender: UITextField) {
        sender == emailTextField ? (viewModel.email = sender.text) : (viewModel.password = sender.text)
        updateForm()
    }
    
    private func updateForm() {
        loginButton.isEnabled = viewModel.formIsFaild
        loginButton.backgroundColor = viewModel.background
        loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
    }
    
    private func navigateToConversation() {
        let controller = ConversationViewController()
        let navigation = UINavigationController(rootViewController: controller)
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
}

//MARK: - register delegate
extension LoginViewController: RegisterViewControllerDalegate {
    
    func didSuccessCreateAccount(_ ViewController: RegisterViewController) {
        ViewController.navigationController?.popViewController(animated: true)
        navigateToConversation()
    }
    
    
    
    
    
}
