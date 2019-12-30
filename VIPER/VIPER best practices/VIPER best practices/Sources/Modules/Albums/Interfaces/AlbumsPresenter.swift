//
//  AlbumsPresenter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation

protocol AlbumsPresenter: class {
    
    var router: AlbumsRouter? { get set }
    var interactor: AlbumsInteractor? { get set }
    var view: AlbumsView? { get set }
    
}
