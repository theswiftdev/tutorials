//
//  PostDetailsView.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 07..
//

import Foundation

protocol PostDetailsView: class {
    
    var presenter: PostDetailsPresenter? { get set }

    func setup(with bookmark: Bookmark)
    func display(_ comments: [Comment])
}
