//
//  PostsDefaultRouter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation
import UIKit

class PostsDefaultRouter {

    weak var presenter: PostsPresenter?
    weak var viewController: UIViewController?
}

extension PostsDefaultRouter: PostsRouter {

    func showComments(for post: Post) {
        let viewController = PostDetailsModule().buildDefault(with: post, delegate: self)
        self.viewController?.show(viewController, sender: nil)
    }
}

extension PostsDefaultRouter: PostDetailsModuleDelegate {

    func toggleBookmark(for post: Post) {
        self.presenter?.toggleBookmark(for: post)
    }
}
