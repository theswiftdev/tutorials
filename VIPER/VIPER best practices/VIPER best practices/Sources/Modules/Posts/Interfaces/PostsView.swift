//
//  PostsView.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation

protocol PostsView: class {
    
    var presenter: PostsPresenter? { get set }

    func displayLoading()
    func display(_ bookmarks: [Bookmark])
    func display(_ error: Error)
    
    
}
