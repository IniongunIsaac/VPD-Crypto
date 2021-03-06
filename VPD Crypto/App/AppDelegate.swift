//
//  AppDelegate.swift
//  Spottr
//
//  Created by Isaac Iniongun on 04/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        configureGlobalAppAppearance()
        
        FirebaseApp.configure()
        
        IQKeyboardManager.shared.enable = true
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


    fileprivate func configureGlobalAppAppearance() {
        let iPadAttributes = [NSAttributedString.Key.font : UIFont.sfProDisplayRegular(size: 16)]
        let iPadTraitCollection = UITraitCollection.init(traitsFrom: [.init(horizontalSizeClass: .regular), .init(verticalSizeClass: .regular)])
        let iPhoneTraitCollection = UITraitCollection.init(traitsFrom: [.init(horizontalSizeClass: .compact), .init(verticalSizeClass: .regular)])
        
        //configurations for iPads: wRhR
        UIBarButtonItem.appearance(for: iPadTraitCollection).setTitleTextAttributes(iPadAttributes, for: .normal)
        UITabBarItem.appearance(for: iPadTraitCollection).setTitleTextAttributes(iPadAttributes, for: .normal)
        UINavigationBar.appearance(for: iPadTraitCollection).titleTextAttributes = [NSAttributedString.Key.font : UIFont.sfProDisplaySemiBold(size: 18)]
        
        //configurations for iPhones: wChR
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font : UIFont.sfProDisplayRegular(size: 16), NSAttributedString.Key.foregroundColor : UIColor.aLabel], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font : UIFont.sfProDisplaySemiBold(size: 12)], for: .normal)
        UINavigationBar.appearance(for: iPhoneTraitCollection).titleTextAttributes = [NSAttributedString.Key.font : UIFont.sfProDisplaySemiBold(size: 16)]
        UINavigationBar.appearance(for: iPhoneTraitCollection).tintColor = UIColor.aLabel
        
    }
    
}

