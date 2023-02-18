//
//  SplashViewController.swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 18.02.2023.
//

import UIKit
import Firebase

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser?.uid == nil {
            let controller = LoginViewController()
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        } else {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            showLoader(false)
            UserService.fetchUser(uid: uid) { user in
                self.showLoader(false)
                let controller = ConversationViewController(user: user)
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            }
        }
    }
}
