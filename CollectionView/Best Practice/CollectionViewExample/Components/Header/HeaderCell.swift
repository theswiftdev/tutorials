//
//  HeaderCell.swift
// CollectionViewExample
//
//  Created by Tibor Bödecs on 2018. 04. 13..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

class HeaderCell: Cell {
    
    @IBOutlet weak var textLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.textLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        self.textLabel.textColor = .black
    }
    
    override func reset() {
        super.reset()
        
        self.textLabel.text = nil
    }
}
