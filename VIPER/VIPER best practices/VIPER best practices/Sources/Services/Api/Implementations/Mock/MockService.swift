//
//  MockService.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation

class MockService {
    
}

extension MockService: ApiService {
    func posts() -> Promise<[Post]> {
        return Promise<[Post]>()
    }
    
    func comments(for post: Post) -> Promise<[Comment]> {
        return Promise<[Comment]>()
    }
    
    func albums() -> Promise<[Album]> {
        return Promise<[Album]>()
    }
    
    func photos(for album: Album) -> Promise<[Photo]> {
        return Promise<[Photo]>()
    }
    
    func todos() -> Promise<[Todo]> {
        return Promise<[Todo]>()
    }
    
    
}
