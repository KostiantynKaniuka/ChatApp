//
//  AuthServices.swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 15.02.2023.
//

import Foundation
import Firebase
import FirebaseFirestore


struct AuthServices {
    
    static func loginUser(withEmail email: String, withPassword password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    static func registerUser(creadtional: AuthCreateUser, completion: @escaping(Error?) -> Void) {
        FileUploader.uploadImage(image: creadtional.profileName) { imageURL in
            Auth.auth().createUser(withEmail: creadtional.email, password: creadtional.password) { result, error in
                if let error = error {
                    print("Error create account \(error.localizedDescription)")
                    return
                }
                guard let userId = result?.user.uid else { return }
                let data: [String: Any] = [
                    "email": creadtional.email,
                    "username": creadtional.email,
                    "fullname": creadtional.fullName,
                    "userId": userId,
                    "profileImageURL": imageURL
                ]
                collectionUser.document(userId).setData(data, completion: completion)
            }
        }
    }
}
