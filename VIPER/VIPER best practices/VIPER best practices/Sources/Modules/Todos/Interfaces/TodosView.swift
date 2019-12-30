//
//  TodosView.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation

protocol TodosView: class {
    
    var presenter: TodosPresenter? { get set }

}
