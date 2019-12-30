//
//  UDPServer.swift
//  Networking
//
//  Created by Tibor Bödecs on 2018. 02. 22..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import Foundation
import Network

class UDPServer: NSObject {
    
    //var socket: GCDAsyncUdpSocket!
    let socketPort: UInt16 = 5566
    
    var service: NetService!
    let servicePort: Int32 = 5667

    var registeredName : String?
    
    var callback: ((String, String) -> Void)?
    
    static let shared = UDPServer()
    
    private override init() {
        super.init()
        
        self.service = NetService(domain: UDPConfig.domain,
                                  type: UDPConfig.service,
                                  name: NetworkDevice.name,
                                  port: self.servicePort)
        self.service.delegate = self
        self.service.publish()
        
//        self.socket = GCDAsyncUdpSocket(delegate: self, delegateQueue: .main)
//        let _ = try? self.socket.bind(toPort: self.socketPort)
//        let _ = try? self.socket.beginReceiving()
    }
}

extension UDPServer: NetServiceDelegate {
    func netServiceDidPublish(sender: NetService) {
        self.registeredName = sender.name
        print("registered \(sender.name)")
    }

    func netService(sender: NetService, didNotPublish errorDict: [String : NSNumber]) {
        print("service error \(errorDict)")
    }
}

//extension UDPServer: GCDAsyncUdpSocketDelegate {
//
//    func udpSocket(_ sock: GCDAsyncUdpSocket,
//                   didReceive data: Data,
//                   fromAddress address: Data,
//                   withFilterContext filterContext: Any?) {
//        guard
//            let address = GCDAsyncUdpSocket.host(fromAddress: address),
//            let message = String(data: data, encoding: .utf8),
//            let callback = self.callback
//        else {
//            return
//        }
//        callback(message, address)
//    }
//}
//
