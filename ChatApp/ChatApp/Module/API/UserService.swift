//
//  UserService.swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 18.02.2023.
//

import Foundation
import FirebaseFirestore

struct UserService {
    
    static func fetchUser(uid: String, completion: @escaping(User) -> Void) {
        collectionUser.document(uid).getDocument { (snapshot, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let dictionary = snapshot?.data() else { return }
            let user = User(dictionary: dictionary)
            completion(user)
        }
    }
}
