//
//  ViewController.swift
//  tvOS
//
//  Created by Tibor Bödecs on 2018. 02. 22..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

