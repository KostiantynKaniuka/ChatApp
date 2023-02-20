//
//  NewChatViewController.swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 19.02.2023.
//

import UIKit

class NewChatViewController: UIViewController {
    //MARK: - properties
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    //MARK: - methods
    //MARK: - helpers
    private func configureUI() {
        view.backgroundColor = .white
        title = "Search"
    }
    
}
