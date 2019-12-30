//
//  Api.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation

protocol ApiService {

    func posts() -> Promise<[Post]>
    func comments(for post: Post) -> Promise<[Comment]>
    func albums() -> Promise<[Album]>
    func photos(for album: Album) -> Promise<[Photo]>
    func todos() -> Promise<[Todo]>
}
