//
//  CollectionViewModel.swift
//  CollectionViewExample
//
//  Created by Tibor Bödecs on 2019. 08. 24..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import UIKit

class CollectionViewModel: ViewModel<CollectionCell, CollectionModel> {

    override func updateView() {
        self.view?.source = self.model.source
    }

    override func size(grid: Grid) -> CGSize {
        grid.size(for: self.collectionView, height: 180, items: grid.columns)
    }

}
