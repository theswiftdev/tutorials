//
//  PostBookmarkViewModel.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 06..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation

class BookmarkViewModel: CollectionViewViewModel<TextDetailCell, Bookmark> {

    override func config(cell: TextDetailCell, data: Bookmark, indexPath: IndexPath, grid: Grid) {
        cell.textLabel.text = data.post.title
        cell.detailTextLabel.text = data.isBookmarked ? "👍" : ""
    }
    
    override func size(data: Bookmark, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
        let width = grid.width(for: view, items: grid.columns)
        return CGSize(width: width, height: 64)
    }
}
