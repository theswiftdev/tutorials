//
//  PostBookmark.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 08..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation

struct Bookmark {

    let post: Post
    let isBookmarked: Bool
    
    init(post: Post, isBookmarked: Bool) {
        self.post = post
        self.isBookmarked = isBookmarked
    }
}
