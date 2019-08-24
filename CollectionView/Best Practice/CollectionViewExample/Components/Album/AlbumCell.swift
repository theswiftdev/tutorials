//
//  AlbumCell.swift
//  CollectionViewExample
//
//  Created by Tibor Bödecs on 2018. 04. 12..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

class AlbumCell: Cell {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var detailTextLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.textLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        self.textLabel.textColor = .black

        self.detailTextLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        self.detailTextLabel.textColor = .darkGray
        
        self.imageView.layer.cornerRadius = 8
        self.imageView.layer.masksToBounds = true
    }
    
    override func reset() {
        super.reset()
        
        self.textLabel.text = nil
        self.detailTextLabel.text = nil
        self.imageView.image = nil
    }
}
