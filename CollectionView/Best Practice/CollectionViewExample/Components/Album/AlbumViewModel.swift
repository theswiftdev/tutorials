//
//  AlbumViewModel.swift
//  CollectionViewExample
//
//  Created by Tibor Bödecs on 2019. 08. 24..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import UIKit

class AlbumViewModel: ViewModel<AlbumCell, AlbumModel> {

    override func updateView() {
        self.view?.textLabel.text = self.model.artist
        self.view?.detailTextLabel.text = self.model.name
        self.view?.imageView.image = UIImage(named: self.model.image)
    }

    override func size(grid: Grid) -> CGSize {
        if
            (self.collectionView.traitCollection.userInterfaceIdiom == .phone &&
             self.collectionView.traitCollection.verticalSizeClass == .compact) ||
            self.collectionView?.traitCollection.userInterfaceIdiom == .pad
        {
            return grid.size(for: self.collectionView, ratio: 1.2, items: grid.columns / 4, gaps: grid.columns - 1)
        }
        if grid.columns == 1 {
            return grid.size(for: self.collectionView, ratio: 1.1)
        }
        return grid.size(for: self.collectionView, ratio: 1.2, items: grid.columns / 2, gaps: grid.columns - 1)
    }

}
