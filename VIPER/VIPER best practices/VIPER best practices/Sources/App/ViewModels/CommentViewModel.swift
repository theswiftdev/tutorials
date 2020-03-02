//
//  CommentViewModel.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 06..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import UIKit

class CommentViewModel: ViewModel<TextCell, Comment> {
    
    override var height: CGFloat { 64 }

    override func updateView() {
        self.view?.textLabel.text = self.model.body
    }
}
