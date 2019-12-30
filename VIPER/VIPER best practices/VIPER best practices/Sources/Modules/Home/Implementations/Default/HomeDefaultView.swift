//
//  HomeDefaultView.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation
import UIKit

class HomeDefaultView: UITabBarController {
    
    var presenter: HomePresenter?
}

extension HomeDefaultView: HomeView {

    func display(_ viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
    }
}

