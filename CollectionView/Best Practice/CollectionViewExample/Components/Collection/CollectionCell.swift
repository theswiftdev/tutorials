//
//  CollectionCell.swift
// CollectionViewExample
//
//  Created by Tibor Bödecs on 2018. 04. 13..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

class CollectionCell: Cell {
    
    @IBOutlet weak var collectionView: CollectionView!
    
    open var source: Source? = nil {
        didSet {
            self.collectionView.source = self.source
            self.collectionView.reloadData()
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.showsHorizontalScrollIndicator = false
    }
    
    override func reset() {
        super.reset()
        
        self.source = nil
    }
}
