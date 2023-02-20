//
//  ConversationCell.swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 20.02.2023.
//

import UIKit

class ConversationCell: UITableViewCell {
    //MARK: - properties
    private let profileImageView = CustomImageView(image: #imageLiteral(resourceName: "Google_Contacts_logo copy"),
                                                   width: 60,
                                                   height: 60,
                                                   cornerRadius: 30)
    private let fullName = CustomLabel(text: "Fullname")
    private let recentMessage = CustomLabel(text: "Recent message", color: .lightGray)
    private let  dateLabel = CustomLabel(text: "10/10/2020", color: .lightGray)
    
    //MARK: - lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(profileImageView)
        profileImageView.centerY(inView: self, leftAnchor: leftAnchor)
        
        let stackView = UIStackView(arrangedSubviews: [fullName,recentMessage])
        stackView.axis = .vertical
        stackView.spacing = 7
        stackView.alignment = .leading
        
        addSubview(stackView)
        stackView.centerY(inView: profileImageView,
                          leftAnchor: profileImageView.rightAnchor,
                          paddingLeft: 15)
        
        addSubview(dateLabel)
        dateLabel.centerY(inView: self, rightAnchor: rightAnchor, paddingRight: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - methods
    //MARK: - helpers


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
