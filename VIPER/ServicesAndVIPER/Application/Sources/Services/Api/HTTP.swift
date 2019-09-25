//
//  HTTP.swift
//  ServicesAndVIPER
//
//  Created by Tibor Bödecs on 2019. 09. 25..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation

enum HTTP {

    enum Method: String {
        case get
        //...
    }
    enum Error: LocalizedError {
        case invalidResponse
        case statusCode(Int)
        case unknown(Swift.Error)
    }
}
