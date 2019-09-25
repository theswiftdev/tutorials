//
//  SceneDelegate.swift
//  VIPERAndSwiftUI
//
//  Created by Tibor Bödecs on 2019. 09. 12..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder {
    
    var window: UIWindow?
}

extension SceneDelegate: UIWindowSceneDelegate {
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.rootViewController = TodoModule().build()
        window.makeKeyAndVisible()
    }

}

