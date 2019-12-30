//
//  PhotosDefaultRouter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation
import UIKit

class PhotosDefaultRouter {

    weak var presenter: PhotosPresenter?
    weak var viewController: UIViewController?
}

extension PhotosDefaultRouter: PhotosRouter {

}
