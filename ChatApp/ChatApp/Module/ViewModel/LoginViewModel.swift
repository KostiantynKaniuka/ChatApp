//
//  LoginViewModel.swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 10.02.2023.
//

import UIKit

protocol AuthLoginModel {
    var formIsFaild: Bool { get }
    var background: UIColor { get }
    var buttonTitleColor: UIColor { get }
}

struct LoginViewModel: AuthLoginModel {
    var email: String?
    var password: String?
    
    var formIsFaild: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    var background: UIColor {
        return formIsFaild ? (UIColor.black) : (UIColor.black.withAlphaComponent(0.5))
    }
    
    var buttonTitleColor: UIColor {
        return formIsFaild ? (UIColor.white) : (UIColor(white: 1, alpha: 0.7))
    }
}
