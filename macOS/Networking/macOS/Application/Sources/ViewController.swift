//
//  ViewController.swift
//  macOS
//
//  Created by Tibor Bödecs on 2018. 02. 22..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        TCPServer.shared.dataReceivedCallback = { data in
            print(data)
        }
        UDPServer.shared.callback = { message, address in
            print("Message: \(message), from: \(address)")
        }
        BluetoothServer.shared.start()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

