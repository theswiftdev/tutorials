//
//  App.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation

class App {
    
    static let shared = App()
    
    private init() {
        
    }

    var apiService: ApiService {
        return JSONPlaceholderService()
    }

    var bookmarkService: BookmarkService {
        return DefaultBookmarkService()
    }
}
