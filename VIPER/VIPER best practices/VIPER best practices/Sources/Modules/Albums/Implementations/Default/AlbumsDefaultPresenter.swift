//
//  AlbumsDefaultPresenter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation

class AlbumsDefaultPresenter {
    
    var router: AlbumsRouter?
    var interactor: AlbumsInteractor?
    weak var view: AlbumsView?
}

extension AlbumsDefaultPresenter: AlbumsPresenter {

}
