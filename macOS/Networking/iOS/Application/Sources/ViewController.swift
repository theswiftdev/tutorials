//
//  ViewController.swift
//  Networking
//
//  Created by Tibor Bödecs on 2018. 02. 22..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {

    let testData = "Maecenas faucibus mollis interdum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Curabitur blandit tempus porttitor. Nullam quis risus eget urna mollis ornare vel eu leo. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Nulla vitae elit libero, a pharetra augue. Nulla vitae elit libero, a pharetra augue. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna. Sed posuere consectetur est at lobortis. Nullam quis risus eget urna mollis ornare vel eu leo. Maecenas faucibus mollis interdum. Sed posuere consectetur est at lobortis. Nullam id dolor id nibh ultricies vehicula ut id elit. Aenean lacinia bibendum nulla sed consectetur. Nulla vitae elit libero, a pharetra augue. Maecenas sed diam eget risus varius blandit sit amet non magna. Curabitur blandit tempus porttitor. Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if WCSession.isSupported() {
            
            WCSession.default.delegate = self;
            WCSession.default.activate()
        }
        
        TCPClient.shared.servicesCallback = { services in
            guard let service = services.first else {
                print("Error: no services.")
                return
            }
            print("Connecting to: \(service.name)")
            
            TCPClient.shared.connectTo(service: service) {
                TCPClient.shared.send(message: self.testData)
            }
        }
        
        UDPClient.shared.servicesCallback = { services in
            guard let service = services.first else {
                print("Error: no services.")
                return
            }
            service.delegate = UDPClient.shared
            service.resolve(withTimeout: 0)
        }
        
        UDPClient.shared.resolvedCallback = {
            UDPClient.shared.send(message: "Maecenas faucibus mollis interdum.")
        }

        BluetoothClient.shared.startAdvertising()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: WCSessionDelegate {

    func session(_ session: WCSession,
                 didReceiveMessage message: [String : Any],
                 replyHandler: @escaping ([String : Any]) -> Void) {
        guard let counterValue = message["counterValue"] as? String else {
            print("Error: no counter value received.")
            return
        }
        print(counterValue)
        
    }
}
