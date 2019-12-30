//
//  PostDetailsPresenter.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 07..
//

import Foundation

protocol PostDetailsPresenter: class {
    
    var router: PostDetailsRouter? { get set }
    var interactor: PostDetailsInteractor? { get set }
    var view: PostDetailsView? { get set }
    
    func reload()
    func toggleBookmark()
}
