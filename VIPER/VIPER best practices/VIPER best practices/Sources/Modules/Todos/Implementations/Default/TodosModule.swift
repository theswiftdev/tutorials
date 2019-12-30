//
//  TodosDefaultBuilder.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation
import UIKit

class TodosModule {

    func buildDefault() -> UIViewController {
        let view = TodosDefaultView()
        let interactor = TodosDefaultInteractor()
        let presenter = TodosDefaultPresenter()
        let router = TodosDefaultRouter()

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
