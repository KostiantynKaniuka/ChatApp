//
//  ChatCell.swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 20.02.2023.
//

import UIKit

class ChatCell: UICollectionViewCell {
    //MARK: - properties
    private let profileImageView = CustomImageView(width: 30,
                                                   height: 30,
                                                   backgroundColor: .lightGray,
                                                   cornerRadius: 15)
    private let dataLabel = CustomLabel(text: "10/10/2023")
    
    private let bubbleContainer: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    var bubbleRightAnchor: NSLayoutConstraint!
    var bubbleLeftAnchor: NSLayoutConstraint!
    
    private let textView: UITextView = {
       let textField = UITextView()
        textField.backgroundColor = .clear
        textField.isEditable = false
        textField.isScrollEnabled = false
        textField.font = .systemFont(ofSize: 16)
        return textField
    }()
    
    
    //MARK: - lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageView)
        profileImageView.anchor(left: leftAnchor, bottom: bottomAnchor, paddingLeft: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - methods
    //MARK: - helpers
}
