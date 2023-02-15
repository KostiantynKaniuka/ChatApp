//
//  CustomLabel.swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 15.02.2023.
//

import UIKit

class CustomLabel: UILabel {
    init(text: String, labelFont: UIFont = .systemFont(ofSize: 14), color: UIColor = .black) {
        super.init(frame: .zero)
        self.text = text
        font = labelFont
        textColor = color
        textAlignment = .center
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
