//
//  TodosRouter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation

protocol TodosRouter {
    
    var presenter: TodosPresenter? { get set }
    
}
