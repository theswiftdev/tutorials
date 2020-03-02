//
//  MainDefaultRouter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation
import UIKit

class MainDefaultRouter {

    weak var presenter: MainPresenter?
    weak var viewController: UIViewController?
}

extension MainDefaultRouter: MainRouter {

    func showHome() {
        let viewController = HomeModule().buildDefault()
        viewController.modalPresentationStyle = .fullScreen
        self.viewController?.present(viewController, animated: true, completion: nil)
    }
}
