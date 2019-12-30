//
//  PostDetailsDefaultPresenter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 07..
//

import Foundation

class PostDetailsDefaultPresenter {
    
    var router: PostDetailsRouter?
    var interactor: PostDetailsInteractor?
    weak var view: PostDetailsView?
    
    let post: Post
    
    init(post: Post) {
        self.post = post
    }
}

extension PostDetailsDefaultPresenter: PostDetailsPresenter {

    func reload() {
        self.view?.setup(with: self.interactor!.bookmark(for: self.post))
        
        //display loading...
        self.interactor?.comments(for: self.post)
        .onSuccess(queue: .main) { comments in
            self.view?.display(comments)
        }
        .onFailure(queue: .main) { error in
            //display error...
        }
    }

    func toggleBookmark() {
        self.router?.toggleBookmark(for: self.post)
        self.view?.setup(with: self.interactor!.bookmark(for: self.post))
    }
    
}
