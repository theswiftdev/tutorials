//
//  SeparatorViewModel.swift
//  CollectionViewExample
//
//  Created by Tibor Bödecs on 2019. 08. 24..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import UIKit

class SeparatorViewModel: ViewModel<SeparatorCell, SeparatorModel> {

    override var height: CGFloat {
        44
    }

    override func updateView() {
        self.view?.contentView.backgroundColor = self.model.color
    }

    override func size(grid: Grid) -> CGSize {
        grid.size(for: self.collectionView, height: self.model.height, items: grid.columns)
    }
}
