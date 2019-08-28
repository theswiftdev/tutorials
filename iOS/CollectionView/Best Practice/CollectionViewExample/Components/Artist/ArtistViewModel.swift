//
//  ArtistViewModel.swift
//  CollectionViewExample
//
//  Created by Tibor Bödecs on 2019. 08. 24..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import UIKit

class ArtistViewModel: ViewModel<ArtistCell, ArtistModel> {

    override func updateView() {
        self.view?.textLabel.text = self.model.name
        self.view?.imageView.image = UIImage(named: self.model.image)
    }

    override func size(grid: Grid) -> CGSize {
        if grid.columns == 1 {
            return grid.size(for: self.collectionView, ratio: 1.2)
        }
        
        if
            (self.collectionView.traitCollection.userInterfaceIdiom == .phone &&
             self.collectionView.traitCollection.verticalSizeClass == .compact) ||
            self.collectionView?.traitCollection.userInterfaceIdiom == .pad
        {
            return grid.size(for: self.collectionView, ratio: 1.2, items: 1, gaps: 3)
        }
        return grid.size(for: self.collectionView, ratio: 1.2, items: 2, gaps: 1)
    }
}

class HorizontalArtistViewModel: ArtistViewModel {

    override func size(grid: Grid) -> CGSize {
        .init(width: 140, height: 164)
    }
}
