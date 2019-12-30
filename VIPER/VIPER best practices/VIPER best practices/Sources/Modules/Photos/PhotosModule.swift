//
//  PhotosDefaultBuilder.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation
import UIKit

class PhotosModule {

    func buildDefault() -> UIViewController {
        let view = PhotosDefaultView()
        let interactor = PhotosDefaultInteractor()
        let presenter = PhotosDefaultPresenter()
        let router = PhotosDefaultRouter()

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
