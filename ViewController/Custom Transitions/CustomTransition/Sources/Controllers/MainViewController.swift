//
//  MainViewController.swift
//  CustomTransition
//
//  Created by Tibor Bödecs on 2018. 04. 25..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.delegate = self
    }
}

extension MainViewController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            return SystemPushAnimator(type: .navigation)
        case .pop:
            return SystemPopAnimator(type: .navigation)
        default:
            return nil
        }
    }    
}

