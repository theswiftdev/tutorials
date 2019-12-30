//
//  PhotosPresenter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation

protocol PhotosPresenter: class {
    
    var router: PhotosRouter? { get set }
    var interactor: PhotosInteractor? { get set }
    var view: PhotosView? { get set }
    
}
