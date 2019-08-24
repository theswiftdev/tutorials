//
//  SongViewModel.swift
//  CollectionViewExample
//
//  Created by Tibor Bödecs on 2019. 08. 24..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import UIKit

class SongViewModel: ViewModel<SongCell, SongModel> {

//    override var height: CGFloat {
//        return 44
//    }

    override func updateView() {
        self.view?.numberLabel.text = String(self.indexPath.row + 1)
        self.view?.textLabel.text = self.model.name
        self.view?.detailTextLabel.text = self.model.duration
    }
    
    override func size(grid: Grid) -> CGSize {
        grid.size(for: self.collectionView, height: 44, items: grid.columns)
    }

}

