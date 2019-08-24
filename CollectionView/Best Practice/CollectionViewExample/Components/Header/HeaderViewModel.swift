//
//  HeaderViewModel.swift
//  CollectionViewExample
//
//  Created by Tibor Bödecs on 2019. 08. 24..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import UIKit

class HeaderViewModel: ViewModel<HeaderCell, HeaderModel> {

    override var height: CGFloat {
        64
    }

    override func updateView() {
        self.view?.textLabel.text = self.model.title
    }

}
