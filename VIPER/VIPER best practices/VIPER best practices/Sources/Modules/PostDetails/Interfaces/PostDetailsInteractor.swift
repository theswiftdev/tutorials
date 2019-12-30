//
//  PostDetailsInteractor.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 07..
//

import Foundation

protocol PostDetailsInteractor {
    
    var presenter: PostDetailsPresenter? { get set }
    
    func comments(for post: Post) -> Promise<[Comment]>
    
    func bookmark(for post: Post) -> Bookmark
}
