//
//  BluetoothConfig.swift
//  Networking
//
//  Created by Tibor Bödecs on 2018. 02. 22..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import Foundation
import CoreBluetooth

struct BluetoothConfig {
    
    static let service = CBUUID(string: "E20A39F4-73F5-4BC4-A12F-17D1AD07A961")
    static let characteristics = CBUUID(string: "08590F7E-DB05-467E-8757-72F6FAEB13D4")

    static let EOM = "EOM"
    static let EOMData = BluetoothConfig.EOM.data(using: .utf8)!
}
