//
//  PostsDefaultPresenter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation

class PostsDefaultPresenter {
    
    var router: PostsRouter?
    var interactor: PostsInteractor?
    weak var view: PostsView?
}

extension PostsDefaultPresenter: PostsPresenter {

    func reload() {
        self.view?.displayLoading()
        self.interactor?.posts()
        .onSuccess(queue: .main) { posts in
            let bookmarks = posts.map { self.interactor!.bookmark(for: $0) }
            
            self.view?.display(bookmarks)
        }
        .onFailure(queue: .main) { error in
            self.view?.display(error)
        }
    }

    func didSelect(_ post: Post) {
        self.router?.showComments(for: post)
    }

    func toggleBookmark(for post: Post) {
        self.interactor?.toggleBookmark(post)
        self.reload()
    }
}
