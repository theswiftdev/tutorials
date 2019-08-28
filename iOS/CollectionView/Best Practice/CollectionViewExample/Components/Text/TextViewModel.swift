//
//  TextViewModel.swift
//  CollectionViewExample
//
//  Created by Tibor Bödecs on 2019. 08. 24..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import UIKit

class TextViewModel: ViewModel<TextCell, TextModel> {

    override var height: CGFloat {
        44
    }

    override func updateView() {
        self.view?.textLabel.text = self.model.content
    }

}

class DynamicTextViewModel: TextViewModel {
    
    override func size(grid: Grid) -> CGSize {
        // note: cell has 8pt paddings on every side, that's why the +-16...
        let width = grid.width(for: self.collectionView) - 16
        let font = UIFont.systemFont(ofSize: 12, weight: .bold)
        let height = UILabel.height(forWidth: width - 16, font: font, text: self.model.content)
        return .init(width: width, height: height + 16)
    }
}
