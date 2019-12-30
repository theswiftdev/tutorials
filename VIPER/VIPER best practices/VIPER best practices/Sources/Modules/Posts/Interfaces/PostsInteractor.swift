//
//  PostsInteractor.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation

protocol PostsInteractor {
    
    var presenter: PostsPresenter? { get set }
    
    func posts() -> Promise<[Post]>
    
    func bookmark(for post: Post) -> Bookmark
    func isBookmarked(_ post: Post) -> Bool
    func toggleBookmark(_ post: Post)
}
