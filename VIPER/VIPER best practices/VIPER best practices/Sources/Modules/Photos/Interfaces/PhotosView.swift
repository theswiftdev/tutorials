//
//  PhotosView.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation

protocol PhotosView: class {
    
    var presenter: PhotosPresenter? { get set }

}
