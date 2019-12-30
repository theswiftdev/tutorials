//
//  PostDetailsDefaultRouter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 07..
//

import Foundation
import UIKit

class PostDetailsDefaultRouter {

    weak var presenter: PostDetailsPresenter?
    weak var viewController: UIViewController?
    weak var delegate: PostDetailsModuleDelegate?
}

extension PostDetailsDefaultRouter: PostDetailsRouter {

    func toggleBookmark(for post: Post) {
        self.delegate?.toggleBookmark(for: post)
    }
}
