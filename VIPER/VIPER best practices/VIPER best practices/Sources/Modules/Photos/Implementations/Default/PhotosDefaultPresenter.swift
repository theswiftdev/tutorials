//
//  PhotosDefaultPresenter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation

class PhotosDefaultPresenter {
    
    var router: PhotosRouter?
    var interactor: PhotosInteractor?
    weak var view: PhotosView?
}

extension PhotosDefaultPresenter: PhotosPresenter {

}
