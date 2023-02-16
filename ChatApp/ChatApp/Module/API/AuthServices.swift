//
//  AuthServices.swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 15.02.2023.
//

import Foundation
import Firebase

struct AuthServices {
    static func loginUser() {
        
    }
    
    static func registerUser(creadtional: AuthCreateUser, completion: @escaping(Error?) -> Void) {
        FileUploader.uploadImage(image: creadtional.profileName) { imageURL in
            Auth.auth().createUser(withEmail: creadtional.email, password: creadtional.password) { result, error in
                if let error = error {
                    print("Error create account \(error.localizedDescription)")
                    return
                }
            }
        }
    }
}
