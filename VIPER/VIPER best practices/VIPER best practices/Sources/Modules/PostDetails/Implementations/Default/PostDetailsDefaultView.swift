//
//  PostDetailsDefaultView.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 07..
//

import Foundation
import UIKit

class PostDetailsDefaultView: CollectionViewController {
    
    var presenter: PostDetailsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground

        self.presenter?.reload()
    }
    
    @objc func bookmarkButtonTouched(_ sender: Any) {
        self.presenter?.toggleBookmark()
    }
}

extension PostDetailsDefaultView: PostDetailsView {
    
    func setup(with bookmark: Bookmark) {
        self.title = bookmark.post.title

        let buttonTitle = bookmark.isBookmarked ? "👎" : "👍"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: buttonTitle,
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(self.bookmarkButtonTouched(_:)))
        
        
    }
    
    func display(_ comments: [Comment]) {
        let grid = Grid(columns: 1, margin: UIEdgeInsets(all: 8))
        
        self.collectionView.source = .init(grid: grid, [
            comments.map { CommentViewModel($0) }
        ])

        self.collectionView.reloadData()
    }

}
