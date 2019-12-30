//
//  PostsPresenter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation

protocol PostsPresenter: class {
    
    var router: PostsRouter? { get set }
    var interactor: PostsInteractor? { get set }
    var view: PostsView? { get set }
    
    func reload()
    func didSelect(_ post: Post)
    func toggleBookmark(for post: Post)
}
