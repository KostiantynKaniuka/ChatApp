//
//  ConversationViewController.swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 17.02.2023.
//

import UIKit
import Firebase

class ConversationViewController: UIViewController {
    //MARK: - properties
    private var user: User
    //MARK: - lifecycle
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - methods
    private func configureUI() {
        title = user.fullname
        view.backgroundColor = .white
        let logoutButton = UIBarButtonItem(title: "Loguot", style: .plain, target: self, action: #selector(handleLoguot))
        navigationItem.leftBarButtonItem = logoutButton
    }
    //MARK: - helpers
    
    @objc func handleLoguot() {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true)
        } catch {
            print("Error sign out")
        }
    }
}
