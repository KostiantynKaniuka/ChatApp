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
    private let tableView = UITableView()
    
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
        configureTableView()
    }
    
    //MARK: - methods
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.backgroundColor = .red
    }
    
    private func configureUI() {
        title = user.fullname
        view.backgroundColor = .white
        let logoutButton = UIBarButtonItem(title: "Loguot", style: .plain, target: self, action: #selector(handleLoguot))
        let newConversationButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self , action: #selector(handleNewChat))
        navigationItem.leftBarButtonItem = logoutButton
        navigationItem.rightBarButtonItem = newConversationButton
        
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         left: view.leftAnchor,
                         bottom: view.safeAreaLayoutGuide.bottomAnchor,
                         right: view.rightAnchor,
                         paddingLeft: 15,
                         paddingRight: 15)
        
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
    
    @objc func handleNewChat() {
        let controller = NewChatViewController()
        let nav = UINavigationController(rootViewController: controller)
        present(nav, animated: true)
    }
}

//MARK: - TableView Delegate
extension ConversationViewController: UITableViewDelegate {
    
}

//MARK: - TableView DataSource
extension ConversationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

