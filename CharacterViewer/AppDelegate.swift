//
//  AppDelegate.swift
//  CharacterViewer
//
//  Created by Daniel Song on 6/5/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            let splitViewController = storyboard.instantiateViewController(withIdentifier: "PadSplitViewController")
            self.window?.rootViewController = splitViewController
        } else {
            let navigationController = storyboard.instantiateViewController(withIdentifier: "PhoneNavigationController")
            self.window?.rootViewController = navigationController
        }
        
        return true
    }
}

