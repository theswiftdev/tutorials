//
//  SystemPushAnimator.swift
//  CustomTransition
//
//  Created by Tibor Bödecs on 2018. 04. 26..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

open class SystemPushAnimator: CustomAnimator {
    
    open override func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromViewController = transitionContext.viewController(forKey: .from),
            let toViewController = transitionContext.viewController(forKey: .to)
            else {
                return
        }
        let containerView = transitionContext.containerView
        toViewController.view.frame = containerView.bounds.offsetBy(dx: containerView.frame.size.width, dy: 0.0)
        containerView.addSubview(toViewController.view)
        
        let animations = {
            toViewController.view.frame = containerView.bounds
            fromViewController.view.frame = containerView.bounds.offsetBy(dx: -containerView.frame.size.width, dy: 0)
            
        }
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                       delay: 0,
                       options: [.curveEaseOut],
                       animations: animations) { _ in
                        
                        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}

