//
//  GradientView.swift
//  Layers - Gradient
//
//  Created by Tibor Bödecs on 2017. 10. 31..
//  Copyright © 2017. Tibor Bödecs. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    let gradientLayer = CAGradientLayer()
    
    override var bounds: CGRect {
        didSet {
            self.gradientLayer.frame = self.bounds
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
        self.gradientLayer.allowsEdgeAntialiasing = true
        self.gradientLayer.colors = [UIColor.red, UIColor.blue].map { $0.cgColor }
        self.gradientLayer.locations = [0.0, 1.0]
        self.layer.insertSublayer(self.gradientLayer, at:0)
        
        // you don't need to observe if you override bounds...
        // self.addObserver(self, forKeyPath: "bounds", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard keyPath == "bounds" else {
            return super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
        self.gradientLayer.frame = self.bounds
    }
    
    deinit {
        // don't forget to remove the observer if you observe the bounds
        // self.removeObserver(self, forKeyPath: "bounds")
    }
}

