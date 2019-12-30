//
//  MainRouter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation

protocol MainRouter {
    
    var presenter: MainPresenter? { get set }
    
    func showHome()
}
