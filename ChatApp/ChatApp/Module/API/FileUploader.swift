//
//  FileUploader.swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 16.02.2023.
//

import UIKit
import Firebase

struct FileUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        let userId = Auth.auth().currentUser?.uid ?? "/profileImages/"
        let filename = NSUUID().uuidString
        let reference = Storage.storage().reference(withPath: "/\(userId)/\(filename)")
        
        reference.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            reference.downloadURL { url, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let fileURL = url?.absoluteString else { return }
                completion(fileURL)
            }
        }
    }
}
