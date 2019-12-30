//
//  PostsRouter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation

protocol PostsRouter {
    
    var presenter: PostsPresenter? { get set }
    
    func showComments(for post: Post)
}
