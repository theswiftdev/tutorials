//
//  MainDefaultPresenter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation

class MainDefaultPresenter {
    
    var router: MainRouter?
    var interactor: MainInteractor?
    weak var view: MainView?
}

extension MainDefaultPresenter: MainPresenter {

    func viewDidAppear() {
        self.router?.showHome()
    }
}
