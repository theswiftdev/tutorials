//
//  ConsoleTests.swift
//  ConsoleTests
//
//  Created by Tibor Bödecs on 2017. 10. 18..
//  Copyright © 2017. Tibor Bodecs. All rights reserved.
//

import XCTest
@testable import Console


class ConsoleTests: XCTestCase {

    func testExample() {
        Console.log("Hello World!")
        Console.log(Console.platform)

        #if os(iOS)
            XCTAssert(Console.platform == "iOS")
        #endif
        #if os(macOS)
            XCTAssert(Console.platform == "macOS")
        #endif
        #if os(tvOS)
            XCTAssert(Console.platform == "tvOS")
        #endif
        #if os(watchOS)
            XCTAssert(Console.platform == "watchOS")
        #endif
    }
}
