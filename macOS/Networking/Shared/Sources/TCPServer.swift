//
//  TCPServer.swift
//  Networking
//
//  Created by Tibor Bödecs on 2018. 02. 22..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import Foundation

class TCPServer: NSObject {

    var service: NetService!
    var serviceRunning = false
    var registeredName: String?

    var inputStream: InputStream?
    var outputStream: OutputStream?
    var openedStreams = 0

    var dataReceivedCallback: ((String) -> Void)?

    static let shared = TCPServer()
    
    private override init() {
        super.init()
        
        self.service = NetService(domain: TCPConfig.domain, type: TCPConfig.service, name: NetworkDevice.name, port: 0)
        self.service.includesPeerToPeer = true
        self.service.delegate = self
        self.service.publish(options: .listenForConnections)
        
        self.serviceRunning = true
    }
    
    func openStreams() {
        guard self.openedStreams == 0 else {
            return
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
        
        self.openedStreams = 0
    }
}

extension TCPServer: NetServiceDelegate {
    
    func netServiceDidPublish(_ sender: NetService) {
        self.registeredName = sender.name
    }
    
    func netService(_ sender: NetService,
                    didAcceptConnectionWith inputStream: InputStream,
                    outputStream: OutputStream) {
        OperationQueue.main.addOperation { [weak self] in
            if self?.inputStream != nil {
                inputStream.open()
                inputStream.close()
                outputStream.open()
                outputStream.close()
                return print("connection already open.")
            }
            self?.service?.stop()
            self?.serviceRunning = false
            self?.registeredName = nil
            self?.inputStream = inputStream
            self?.outputStream = outputStream
            self?.openStreams()
            
            print("connection accepted: streams opened.")
        }
    }
}

extension TCPServer: StreamDelegate {

    func stream(_ aStream: Stream, handle eventCode: Stream.Event) {

        if eventCode.contains(.openCompleted) {
            self.openedStreams += 1

            if self.openedStreams == 2 {
                self.service?.stop()
                self.serviceRunning = false
                self.registeredName = nil
            }
        }

        if eventCode.contains(.hasBytesAvailable) {
            guard let inputStream = self.inputStream else {
                return print("no input stream")
            }
            
            let bufferSize     = 4096
            var buffer         = Array<UInt8>(repeating: 0, count: bufferSize)
            var message        = ""
            
            while inputStream.hasBytesAvailable {
                let len = inputStream.read(&buffer, maxLength: bufferSize)
                if len < 0 {
                    print("error reading stream...")
                    return self.closeStreams()
                }
                if len > 0 {
                    message += String(bytes: buffer, encoding: .utf8)!
                }
                if len == 0 {
                    print("no more bytes available...")
                    break
                }
            }
            self.dataReceivedCallback?(message)
        }
    }
}








