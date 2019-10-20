//
//  AppDelegate.swift
//  StackForm
//
//  Created by Tibor Bödecs on 2019. 10. 17..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {

    
}

extension AppDelegate: UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return .init(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

