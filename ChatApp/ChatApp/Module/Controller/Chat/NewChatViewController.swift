//
//  NewChatViewController.swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 19.02.2023.
//

import UIKit

class NewChatViewController: UIViewController {
    //MARK: - properties
    private let newChatTableView = UITableView()
    private let reuseIdentifierNewCell = "NewChatTableViewCell"
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNewChatTableView()
        configureUI()
    }
    //MARK: - methods
    
    
    //MARK: - helpers
    private func configureNewChatTableView() {
        newChatTableView.delegate = self
        newChatTableView.dataSource = self
        newChatTableView.rowHeight = 65
        newChatTableView.register(NewChatTableViewCell.self, forCellReuseIdentifier: reuseIdentifierNewCell)
        newChatTableView.tableFooterView = UIView()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        title = "Search"
        
        view.addSubview(newChatTableView)
        newChatTableView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         left: view.leftAnchor,
                         bottom: view.safeAreaLayoutGuide.bottomAnchor,
                         right: view.rightAnchor,
                         paddingLeft: 15,
                         paddingRight: 15)
    }
    
}

extension NewChatViewController: UITableViewDelegate {
    
}

extension NewChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierNewCell, for: indexPath) as? NewChatTableViewCell else { return UITableViewCell() }
        return cell
    }
}
