//
//  HomeView.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation
import UIKit

protocol HomeView: class {
    
    var presenter: HomePresenter? { get set }

    func display(_ viewControllers: [UIViewController])
}
