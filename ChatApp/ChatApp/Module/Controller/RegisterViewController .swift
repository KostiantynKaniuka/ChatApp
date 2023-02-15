//
//  RegisterViewController .swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 08.02.2023.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    var viewModel = RegisterViewModel()
    private let emailTextField = CustomTextField(placeholder: "Email", keyboardType: .emailAddress)
    private let passwordTextField = CustomTextField(placeholder: "Password", isSecuredText: true)
    private let fullNameTextField = CustomTextField(placeholder: "Fullname")
    private let userNameTextField = CustomTextField(placeholder: "Username")
    
    private lazy var alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedText(firstString: "Already have an account?", secondString: "Login up")
        button.setHeight(50)
        button.addTarget(self, action: #selector(handleAlreadyHaveAccountButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.addTarget(self, action: #selector(handlePlusButton), for: .touchUpInside)
        button.setDimensions(height: 140, width: 140)
        button.tintColor = .lightGray
        
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.blackButton(buttonText: "SignUp")
        button.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        button.isEnabled = false
        
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTextField()
    }
    
    //MARK: - Helpers
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
        alreadyHaveAccountButton.centerX(inView: view)
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view,
                                topAnchor: view.safeAreaLayoutGuide.topAnchor,
                                paddingTop: 30)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullNameTextField, userNameTextField, signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        view.addSubview(stackView)
        stackView.anchor(top: plusPhotoButton.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 30,
                         paddingLeft: 30,
                         paddingRight: 30 )
    }
    
    private func configureTextField() {
        passwordTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
        userNameTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
        fullNameTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
    }
    
    @objc private func handleAlreadyHaveAccountButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func handlePlusButton() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
       present(picker, animated: true)
    }
    
    @objc private func handleSignup() {
        
    }
    
    private func updateForm() {
        signUpButton.isEnabled = viewModel.formIsFaild
        signUpButton.backgroundColor = viewModel.background
        signUpButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
    }
    
    @objc private func handleTextField(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        } else if sender == passwordTextField {
            viewModel.password = sender.text
        } else if sender == userNameTextField {
            viewModel.userName = sender.text
        } else {
            viewModel.fullName = sender.text
        }
        updateForm()
    }
}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        plusPhotoButton.layer.cornerRadius = plusPhotoButton.frame.width / 2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.layer.borderColor = UIColor.black.cgColor
        plusPhotoButton.layer.borderWidth = 2 
        plusPhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        dismiss(animated: true, completion: nil)
    }
}
