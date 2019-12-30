//
//  UDPClient.swift
//  Networking
//
//  Created by Tibor Bödecs on 2018. 02. 22..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import Foundation
import Network

class UDPClient: NSObject {

    //let socket = GCDAsyncUdpSocket()
    let socketPort: UInt16 = 5566
    
    var hostName: String?
    
    let serviceDomain = "local"
    var serviceBrowser: NetServiceBrowser!
    var services : [NetService] = []
    var servicesCallback : (([NetService]) ->())?
    
    var resolved = false
    var resolvedCallback: (() -> Void)?
    
    static let shared = UDPClient()

    private override init() {
        super.init()
        
        self.serviceBrowser = NetServiceBrowser()
        self.serviceBrowser.delegate = self
        self.serviceBrowser.searchForServices(ofType: UDPConfig.service, inDomain: self.serviceDomain)
    }

    func send(message: String) {
        guard let host = self.hostName, let data = message.data(using: .utf8) else {
            return
            
        }
        //self.socket.send(data, toHost: host, port: self.socketPort, withTimeout: -1, tag: 0)        
    }
}

extension UDPClient: NetServiceBrowserDelegate {
    
    func netServiceBrowser(_ browser: NetServiceBrowser, didFind service: NetService, moreComing: Bool) {
        print("found:" + service.name)
        
        self.services.append(service)
        
        if !moreComing {
            if let callback = self.servicesCallback {
                callback(self.services)
            }
        }
    }
    
    func netServiceBrowser(_ browser: NetServiceBrowser, didRemove service: NetService, moreComing: Bool) {
        print("removed:" + service.name)
        
        self.services = self.services.filter() { $0 != service }
        
        if !moreComing {
            if let callback = self.servicesCallback {
                callback(self.services)
            }
        }
    }
}

extension UDPClient: NetServiceDelegate {

    func netServiceDidResolveAddress(_ sender: NetService) {
        guard let host = sender.hostName else {
            return print("could not resolve host")
        }
        self.hostName = host
        
        print("resolved host: \(self.hostName!)")
        
        if !self.resolved {
            self.resolved = true
            self.resolvedCallback?()
        }
    }
}
