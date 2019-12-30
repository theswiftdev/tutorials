//
//  PhotosDefaultView.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//

import Foundation
import UIKit

class PhotosDefaultView: UIViewController {
    
    var presenter: PhotosPresenter?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.title = "Photos"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
    }
}

extension PhotosDefaultView: PhotosView {

}
