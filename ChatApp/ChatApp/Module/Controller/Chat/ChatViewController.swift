//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 20.02.2023.
//

import UIKit

class ChatViewController: UICollectionViewController {
    //MARK: - properties
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //MARK: - methods
    //MARK: - helpers

    
}


extension ChatViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
