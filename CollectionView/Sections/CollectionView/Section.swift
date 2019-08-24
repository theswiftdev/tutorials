//
//  Section.swift
//  CollectionView
//
//  Created by Tibor Bödecs on 2018. 04. 16..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

class Section: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.contentView.backgroundColor = .darkGray
        self.textLabel.textColor = .white
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.textLabel.text = nil
    }
}

