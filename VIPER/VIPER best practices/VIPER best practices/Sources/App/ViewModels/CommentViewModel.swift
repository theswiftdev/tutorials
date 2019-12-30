//
//  CommentViewModel.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 06..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation

class CommentViewModel: CollectionViewViewModel<TextCell, Comment> {
    
    override func config(cell: TextCell, data: Comment, indexPath: IndexPath, grid: Grid) {
        cell.textLabel.text = data.body
    }
    
    override func size(data: Comment, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
        let width = grid.width(for: view, items: grid.columns)
        return CGSize(width: width, height: 64)
    }
}
