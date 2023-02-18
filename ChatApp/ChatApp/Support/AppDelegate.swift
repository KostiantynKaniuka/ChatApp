//
//  AppDelegate.swift
//  ChatApp
//
//  Created by Kostiantyn Kaniuka on 07.02.2023.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
