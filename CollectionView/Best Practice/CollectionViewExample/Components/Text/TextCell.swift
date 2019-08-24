//
//  TextCell.swift
// CollectionViewExample
//
//  Created by Tibor Bödecs on 2018. 04. 13..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

class TextCell: Cell {
    
    @IBOutlet weak var textLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.textLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        self.textLabel.textColor = .black
        self.textLabel.numberOfLines = 0
    }
    
    override func reset() {
        super.reset()
        
        self.textLabel.text = nil
    }
}
