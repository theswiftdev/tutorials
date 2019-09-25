//
//  SceneDelegate.swift
//  ServicesAndVIPER
//
//  Created by Tibor Bödecs on 2019. 09. 25..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder {

    var window: UIWindow?
}

extension SceneDelegate: UIWindowSceneDelegate {

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else {
            return
        }
    }
}

