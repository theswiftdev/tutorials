//
//  PostsDefaultBuilder.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation
import UIKit

class PostsModule {

    func buildDefault() -> UIViewController {
        let view = PostsDefaultView()
        let interactor = PostsDefaultInteractor(apiService: App.shared.apiService,
                                                bookmarkService: App.shared.bookmarkService)
        let presenter = PostsDefaultPresenter()
        let router = PostsDefaultRouter()

        view.presenter = presenter

        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router

        interactor.presenter = presenter

        router.presenter = presenter
        router.viewController = view
        
        return view
    }
}
