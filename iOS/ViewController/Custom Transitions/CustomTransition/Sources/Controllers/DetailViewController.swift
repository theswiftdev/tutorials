//
//  DetailViewController.swift
//  CustomTransition
//
//  Created by Tibor Bödecs on 2018. 04. 25..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var interactionController: LeftEdgeInteractionController?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .lightGray

        self.interactionController = LeftEdgeInteractionController(viewController: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.delegate = self
    }
 

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        guard let controller = segue.destination as? ModalViewController else {
            return
        }
        
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .custom
        controller.modalPresentationCapturesStatusBarAppearance = true
    }
}

extension DetailViewController: UIViewControllerTransitioningDelegate {

    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadePushAnimator(type: .modal)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        var interactionController: UIPercentDrivenInteractiveTransition?
        if let viewController = dismissed as? ModalViewController {
            interactionController = viewController.interactionController
        }
        return FadePopAnimator(type: .modal,
                               interactionController: interactionController)
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning)
        -> UIViewControllerInteractiveTransitioning? {

        guard
            let animator = animator as? FadePopAnimator,
            let interactionController = animator.interactionController as? LeftEdgeInteractionController,
            interactionController.inProgress
        else {
            return nil
        }
        return interactionController
    }
}

extension DetailViewController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            return SystemPushAnimator(type: .navigation)
        case .pop:
            return SystemPopAnimator(type: .navigation,
                                     interactionController: self.interactionController)
        default:
            return nil
        }
    }
   
    func navigationController(_ navigationController: UINavigationController,
                              interactionControllerFor animationController: UIViewControllerAnimatedTransitioning)
        -> UIViewControllerInteractiveTransitioning? {

        guard
            let animator = animationController as? SystemPopAnimator,
            let interactionController = animator.interactionController as? LeftEdgeInteractionController,
            interactionController.inProgress
        else {
            return nil
        }
        return interactionController
    }
}
