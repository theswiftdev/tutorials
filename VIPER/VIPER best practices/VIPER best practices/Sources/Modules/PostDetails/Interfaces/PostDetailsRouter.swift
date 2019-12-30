//
//  PostDetailsRouter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 07..
//

import Foundation

protocol PostDetailsRouter {
    
    var presenter: PostDetailsPresenter? { get set }
    
    func toggleBookmark(for post: Post)
}
