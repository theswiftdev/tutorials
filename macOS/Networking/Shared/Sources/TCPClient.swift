//
//  TCPClient.swift
//  Networking
//
//  Created by Tibor Bödecs on 2018. 02. 22..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import Foundation

class TCPClient: NSObject {
    
    var serviceBrowser: NetServiceBrowser!
    var services: [NetService] = []
    var servicesCallback: (([NetService]) -> Void)?
    
    var streamsConnected = false
    var streamsConnectedCallback: (() -> Void)?

    let serviceDomain = "local"
    var inputStream: InputStream?
    var outputStream: OutputStream?
    var openedStreams = 0
    
    static let shared = TCPClient()
    
    private override init() {
        super.init()
        
        self.startBrowsingServices()
    }
    
    func startBrowsingServices() {
        self.serviceBrowser = NetServiceBrowser()
        self.serviceBrowser?.includesPeerToPeer = true
        self.serviceBrowser?.delegate = self
        self.serviceBrowser?.searchForServices(ofType: TCPConfig.service, inDomain: self.serviceDomain)
    }

    func connectTo(service: NetService, callback: (() -> Void)?) {
        self.streamsConnectedCallback = callback
        
        var inputStream: InputStream?
        var outputStream: OutputStream?
        
        let success = service.getInputStream(&inputStream, outputStream: &outputStream)
        
        if !success {
            return print("could not connect to service")
        }
        self.inputStream  = inputStream
        self.outputStream = outputStream
        
        self.openStreams()
        
        print("connecting...")
    }
    
    func openStreams() {
        guard self.openedStreams == 0 else {
            return print("streams already opened... \(self.openedStreams)")
        }
        
        self.inputStream?.delegate = self
        self.inputStream?.schedule(in: .current, forMode: .default)
        self.inputStream?.open()
        
        self.outputStream?.delegate = self
        self.outputStream?.schedule(in: .current, forMode: .default)
        self.outputStream?.open()
    }

    func closeStreams() {
        self.inputStream?.remove(from: .current, forMode: .default)
        self.inputStream?.close()
        self.inputStream = nil
        
        self.outputStream?.remove(from: .current, forMode: .default)
        self.outputStream?.close()
        self.outputStream = nil
        
        self.streamsConnected = false
        self.openedStreams = 0
    }

    func send(message: String) {
        guard self.openedStreams == 2 else {
            return print("no open streams \(self.openedStreams)")
        }
        
        guard self.outputStream!.hasSpaceAvailable else {
            return print("no space available")
        }
        
        let data = message.data(using: .utf8)!
 
        let bytesWritten = data.withUnsafeBytes { self.outputStream?.write($0, maxLength: data.count) }

        guard bytesWritten == data.count else {
            self.closeStreams()
            print("something is wrong...")
            return
        }
        print("data written... \(message)")
    }
}

extension TCPClient: NetServiceBrowserDelegate {
    
    func netServiceBrowser(_ browser: NetServiceBrowser, didFind service: NetService, moreComing: Bool) {
        print("service found:" + service.name)
        self.services.append(service)
        
        if !moreComing {
            if let callback = self.servicesCallback {
                callback(self.services)
            }
        }
    }
    
    func netServiceBrowser(_ browser: NetServiceBrowser, didRemove service: NetService, moreComing: Bool) {
        print("service removed:" + service.name)
        self.services = self.services.filter() { $0 != service }
        
        if !moreComing {
            if let callback = self.servicesCallback {
                callback(self.services)
            }
        }
    }
}

extension TCPClient: StreamDelegate {
    
    func stream(aStream: Stream, handleEvent eventCode: Stream.Event) {
        if eventCode.contains(.openCompleted) {
            self.openedStreams += 1
        }
        if eventCode.contains(.hasSpaceAvailable) {
            if self.openedStreams == 2 && !self.streamsConnected {
                print("streams connected.")
                self.streamsConnected = true
                self.streamsConnectedCallback?()
            }
        }
    }
}
