//
//  ConversationViewController.swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 17.02.2023.
//

import UIKit

class ConversationViewController: UIViewController {
    //MARK: - properties
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "conversation"
        view.backgroundColor = .white
        let nv = navigationController
        nv?.pushViewController(LoginViewController(), animated: true)
    }
    //MARK: - methods
    //MARK: - helpers
}
