//
//  AlbumsDefaultRouter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation
import UIKit

class AlbumsDefaultRouter {

    weak var presenter: AlbumsPresenter?
    weak var viewController: UIViewController?
}

extension AlbumsDefaultRouter: AlbumsRouter {

}
