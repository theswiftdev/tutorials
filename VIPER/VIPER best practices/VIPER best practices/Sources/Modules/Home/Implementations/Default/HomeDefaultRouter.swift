//
//  HomeDefaultRouter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation
import UIKit

class HomeDefaultRouter {

    weak var presenter: HomePresenter?
    weak var viewController: UIViewController?
    
}

extension HomeDefaultRouter: HomeRouter {

    func getViewControllers() -> [UIViewController] {
        return [
            PostsModule().buildDefault(),
            AlbumsModule().buildDefault(),
            PhotosModule().buildDefault(),
            TodosModule().buildDefault(),
        ].map { UINavigationController(rootViewController: $0) }
    }
}
