//
//  PostDetailsDefaultBuilder.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 07..
//

import Foundation
import UIKit

protocol PostDetailsModuleDelegate: class {
    func toggleBookmark(for post: Post)
}

class PostDetailsModule {

    func buildDefault(with post: Post, delegate: PostDetailsModuleDelegate? = nil) -> UIViewController {
        let view = PostDetailsDefaultView()
        let interactor = PostDetailsDefaultInteractor(apiService: App.shared.apiService,
                                                      bookmarkService: App.shared.bookmarkService)
        let presenter = PostDetailsDefaultPresenter(post: post)
        let router = PostDetailsDefaultRouter()

        view.presenter = presenter

        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router

        interactor.presenter = presenter

        router.presenter = presenter
        router.viewController = view
        router.delegate = delegate
        
        return view
    }
}
