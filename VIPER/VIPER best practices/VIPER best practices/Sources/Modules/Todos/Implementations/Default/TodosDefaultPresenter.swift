//
//  TodosDefaultPresenter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation

class TodosDefaultPresenter {
    
    var router: TodosRouter?
    var interactor: TodosInteractor?
    weak var view: TodosView?
}

extension TodosDefaultPresenter: TodosPresenter {

}
