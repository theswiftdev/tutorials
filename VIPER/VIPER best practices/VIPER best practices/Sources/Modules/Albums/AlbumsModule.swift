//
//  AlbumsDefaultBuilder.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation
import UIKit

class AlbumsModule {

    func buildDefault() -> UIViewController {
        let view = AlbumsDefaultView()
        let interactor = AlbumsDefaultInteractor()
        let presenter = AlbumsDefaultPresenter()
        let router = AlbumsDefaultRouter()

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
