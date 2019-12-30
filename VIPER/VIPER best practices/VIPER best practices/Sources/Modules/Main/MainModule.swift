//
//  MainDefaultBuilder.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation
import UIKit

class MainModule {

    func buildDefault() -> UIViewController {
        let view = MainDefaultView()
        let interactor = MainDefaultInteractor()
        let presenter = MainDefaultPresenter()
        let router = MainDefaultRouter()

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
