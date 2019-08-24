//
//  CircularImageView.swift
//  Layers - Circle
//
//  Created by Tibor Bödecs on 2017. 10. 31..
//  Copyright © 2017. Tibor Bödecs. All rights reserved.
//

import UIKit

class CircularImageView: UIImageView {
    
    override var bounds: CGRect {
        didSet {
            self.layer.cornerRadius = round(self.bounds.size.width / 2.0)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initialize()
    }
    
    func initialize() {
        self.backgroundColor = .yellow
    }
}

