//
//  NetworkDevice.swift
//  Networking
//
//  Created by Tibor Bödecs on 2018. 02. 23..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import Foundation
#if os(iOS) || os(tvOS)
import UIKit
#endif

struct NetworkDevice {
    #if os(macOS)
    static let name = Host.current().localizedName!
    #else
    static let name = UIDevice.current.name
    #endif
}
