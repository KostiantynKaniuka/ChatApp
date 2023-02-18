//
//  ConversationViewController.swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 17.02.2023.
//

import UIKit

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
        title = "conversation"
        view.backgroundColor = .white      
    }
    //MARK: - methods
    //MARK: - helpers
}
