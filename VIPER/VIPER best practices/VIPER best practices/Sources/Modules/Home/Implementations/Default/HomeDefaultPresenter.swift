//
//  HomeDefaultPresenter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation

class HomeDefaultPresenter {
    
    var router: HomeRouter?
    var interactor: HomeInteractor?
    weak var view: HomeView?
}

extension HomeDefaultPresenter: HomePresenter {

    func setupViewControllers() {
        guard let controllers = self.router?.getViewControllers() else {
            return
        }
        self.view?.display(controllers)
    }

}
