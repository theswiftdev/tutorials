//
//  DefaultBookmarkService.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 08..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation

private extension Post {
    var bookmarkIdentifier: String {
        return "post-\(self.id)"
    }
}

class DefaultBookmarkService {
    
    let userDefaults = UserDefaults.standard
}


extension DefaultBookmarkService: BookmarkService {

    func bookmark(for post: Post) -> Bookmark {
        return Bookmark(post: post, isBookmarked: self.isBookmarked(post))
    }
    
    func isBookmarked(_ post: Post) -> Bool {
        return self.userDefaults.bool(forKey: post.bookmarkIdentifier)
    }

    func toggleBookmark(for post: Post) {
        let originalValue = self.isBookmarked(post)
        let newValue = !originalValue
        self.userDefaults.set(newValue, forKey: post.bookmarkIdentifier)
        self.userDefaults.synchronize()
    }

}

