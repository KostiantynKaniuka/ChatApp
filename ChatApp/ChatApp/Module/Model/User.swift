//
//  User.swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 18.02.2023.
//

import Foundation

struct User {
    let email: String
    let userName: String
    let fullname: String
    let userId: String
    let profileImageURL: String
    
    init(dictionary: [String: Any]) {
        self.email = dictionary["email"] as? String ?? ""
        self.userName = dictionary["username"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.userId = dictionary["userId"] as? String ?? ""
        self.profileImageURL = dictionary["profileImageURL"] as? String ?? ""
    }
}
