//
//  FadePushAnimator.swift
//  CustomTransition
//
//  Created by Tibor Bödecs on 2018. 04. 26..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

open class FadePushAnimator: CustomAnimator {
    
    open override func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let toViewController = transitionContext.viewController(forKey: .to)
            else {
                return
        }
        transitionContext.containerView.addSubview(toViewController.view)
        toViewController.view.alpha = 0
        
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            toViewController.view.alpha = 1
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
