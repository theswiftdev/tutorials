//
//  AlbumsDefaultView.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation
import UIKit

class AlbumsDefaultView: UIViewController {
    
    var presenter: AlbumsPresenter?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.title = "Albums"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blue
    }
}

extension AlbumsDefaultView: AlbumsView {

}
