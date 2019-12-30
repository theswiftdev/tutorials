//
//  TodosDefaultRouter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation
import UIKit

class TodosDefaultRouter {

    weak var presenter: TodosPresenter?
    weak var viewController: UIViewController?
}

extension TodosDefaultRouter: TodosRouter {

}
