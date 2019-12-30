//
//  PostsDefaultView.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation
import UIKit

class PostsDefaultView: CollectionViewController {
    
    var presenter: PostsPresenter?
    
    weak var activityIndicator: UIActivityIndicatorView!
    
    init() {
        super.init(nibName: nil, bundle: nil)

        self.title = "Posts"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(activityIndicator)
        self.activityIndicator = activityIndicator
        
        NSLayoutConstraint.activate([
            self.activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter?.reload()
    }
}

extension PostsDefaultView: PostsView {

    func displayLoading() {
        self.activityIndicator.isHidden = false
        self.collectionView.isHidden = true
        self.activityIndicator.startAnimating()
    }

    func display(_ bookmarks: [Bookmark]) {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        self.collectionView.isHidden = false

        let grid = Grid(columns: 1, margin: UIEdgeInsets(all: 8))
        
        self.source = CollectionViewSource(grid: grid, sections: [
            CollectionViewSection(items: bookmarks.map { BookmarkViewModel($0) }) { data, indexPath in
                let bookmark = data as! Bookmark
                self.presenter?.didSelect(bookmark.post)
            }
        ])
        self.collectionView.reloadData()
    }

    func display(_ error: Error) {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        self.collectionView.isHidden = true
        
        //show actual error...
        print(error.localizedDescription)
    }
}
