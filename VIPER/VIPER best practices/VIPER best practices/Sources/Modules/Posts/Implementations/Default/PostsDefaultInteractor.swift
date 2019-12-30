//
//  PostsDefaultInteractor.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation

class PostsDefaultInteractor {

    weak var presenter: PostsPresenter?
    
    let apiService: ApiService
    let bookmarkService: BookmarkService

    init(apiService: ApiService, bookmarkService: BookmarkService) {
        self.apiService = apiService
        self.bookmarkService = bookmarkService
    }
}

extension PostsDefaultInteractor: PostsInteractor {
    
    func posts() -> Promise<[Post]> {
        return self.apiService.posts()
    }
    
    func bookmark(for post: Post) -> Bookmark {
        return self.bookmarkService.bookmark(for: post)
    }

    func isBookmarked(_ post: Post) -> Bool {
        return self.bookmarkService.isBookmarked(post)
    }

    func toggleBookmark(_ post: Post) {
        self.bookmarkService.toggleBookmark(for: post)
    }

}
