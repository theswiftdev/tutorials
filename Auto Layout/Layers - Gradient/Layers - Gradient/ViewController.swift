//
//  ViewController.swift
//  Layers - Gradient
//
//  Created by Tibor Bödecs on 2017. 10. 31..
//  Copyright © 2017. Tibor Bödecs. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    weak var gradientView: GradientView!
    
    override func loadView() {
        super.loadView()
        
        self.createGradientView()
    }
    
    func createGradientView() {
        let gradientView = GradientView()
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        self.view.insertSubview(gradientView, at: 0)
        
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: self.view.topAnchor),
            gradientView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            gradientView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        self.gradientView = gradientView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // you can update layer bounds here if you want to
        // self.gradientView.gradientLayer.frame = self.gradientView.bounds
    }
}


