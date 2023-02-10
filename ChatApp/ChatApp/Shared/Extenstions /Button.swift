//
//  Button.swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 10.02.2023.
//

import UIKit

extension UIButton {
    
    func attributedText(firstString: String, secondString: String) {
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.7), .font: UIFont.systemFont(ofSize: 16)]
        let attributetTitle = NSMutableAttributedString(string: "\(firstString) ", attributes: attributes)
        let secondAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.88), .font: UIFont.boldSystemFont(ofSize: 16)]
        attributetTitle.append(NSAttributedString(string: secondString, attributes: secondAttributes))
        setAttributedTitle(attributetTitle, for: .normal)
    }
}
