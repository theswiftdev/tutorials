//
//  HomeRouter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation
import UIKit

protocol HomeRouter {
    
    var presenter: HomePresenter? { get set }
    
    func getViewControllers() -> [UIViewController]
}
