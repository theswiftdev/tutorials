//
//  Cell.swift
//  CircularCells
//
//  Created by Tibor Bödecs on 2018. 01. 24..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!

    override var bounds: CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.imageView.layer.masksToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setCircularImageView()
    }

    func setCircularImageView() {
        self.imageView.layer.cornerRadius = CGFloat(roundf(Float(self.imageView.frame.size.width / 2.0)))
    }
    
}

