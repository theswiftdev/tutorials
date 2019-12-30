//
//  Console.swift
//  Console
//
//  Created by Tibor Bödecs on 2017. 10. 18..
//  Copyright © 2017. Tibor Bodecs. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS) || os(macOS)
    import Foundation

    public class Console {

        #if os(iOS)
        public static let platform = "iOS"
        #endif
        #if os(macOS)
        public static let platform = "macOS"
        #endif
        #if os(tvOS)
        public static let platform = "tvOS"
        #endif
        #if os(watchOS)
        public static let platform = "watchOS"
        #endif

        public static func log<T>(_ object: @autoclosure () -> T,
                           _ file: String = #file,
                           _ function: String = #function,
                           _ line: Int = #line,
                           _ column: Int = #column)
        {
            var fileName = "unknown"
            if let url = URL(string: file), let name = url.lastPathComponent.components(separatedBy: ".").first {
                fileName = name
            }
            let date = Date()
            let log: String = "[\(date)][\(fileName):\(line),\(column)].\(function): \(object())"
            print(log)
        }
    }

#endif
