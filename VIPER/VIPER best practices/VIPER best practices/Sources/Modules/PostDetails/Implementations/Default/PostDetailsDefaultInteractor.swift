//
//  PostDetailsDefaultInteractor.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 07..
//

import Foundation

class PostDetailsDefaultInteractor {

    weak var presenter: PostDetailsPresenter?
    
    let apiService: ApiService
    let bookmarkService: BookmarkService
    
    init(apiService: ApiService, bookmarkService: BookmarkService) {
        self.apiService = apiService
        self.bookmarkService = bookmarkService
    }
}

extension PostDetailsDefaultInteractor: PostDetailsInteractor {
    
    func comments(for post: Post) -> Promise<[Comment]> {
        return self.apiService.comments(for: post)
    }
    
    func bookmark(for post: Post) -> Bookmark {
        return self.bookmarkService.bookmark(for: post)
    }
    
    
    
}
