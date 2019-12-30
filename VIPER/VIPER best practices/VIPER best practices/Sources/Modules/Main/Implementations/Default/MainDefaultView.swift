//
//  MainDefaultView.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation
import UIKit

class MainDefaultView: UIViewController {
    
    var presenter: MainPresenter?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.presenter?.viewDidAppear()
    }
}

extension MainDefaultView: MainView {

}
