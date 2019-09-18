//
//  HTTP.swift
//  VIPERAndSwiftUI
//
//  Created by Tibor Bödecs on 2019. 09. 14..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation

struct HTTP {
    
    enum Method: String {
        case get
        case post
        case put
        case delete
        case patch
    }
    
    enum Error: LocalizedError {
        case unknown(Swift.Error)
        case invalidResponse
        case statusCode(Int)
        case invalidData
    }
}
