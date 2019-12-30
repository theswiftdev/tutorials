//
//  TodosPresenter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation

protocol TodosPresenter: class {
    
    var router: TodosRouter? { get set }
    var interactor: TodosInteractor? { get set }
    var view: TodosView? { get set }
    
}
