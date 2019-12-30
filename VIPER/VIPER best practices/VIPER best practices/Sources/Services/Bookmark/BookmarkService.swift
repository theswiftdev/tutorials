//
//  Bookmark.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 08..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation

protocol BookmarkService {

    func bookmark(for post: Post) -> Bookmark
    func isBookmarked(_ post: Post) -> Bool
    func toggleBookmark(for post: Post)

}
