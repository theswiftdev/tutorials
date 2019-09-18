//
//  TaskRouter.swift
//  VIPERAndSwiftUI
//
//  Created by Tibor Bödecs on 2019. 09. 12..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation
import UIKit

final class TodoRouter: RouterInterface {

    weak var presenter: TodoPresenterRouterInterface!
    
    weak var viewController: UIViewController?
}

extension TodoRouter: TodoRouterPresenterInterface {

}
