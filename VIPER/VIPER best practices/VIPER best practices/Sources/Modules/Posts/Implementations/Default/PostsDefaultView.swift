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
    
    override init() {
        super.init(nibName: nil, bundle: nil)

        self.title = "Posts"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
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
        
        self.view.backgroundColor = .systemBackground

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
        
        let viewModels = bookmarks.map { item -> BookmarkViewModel in
            return BookmarkViewModel(item)
            .onSelect { [weak self] viewModel in
                self?.presenter?.didSelect(viewModel.model.post)
            }
        }
        self.collectionView.source = .init(grid: grid, [viewModels])
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
