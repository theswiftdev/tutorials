//
//  BluetoothClient.swift
//  Networking
//
//  Created by Tibor Bödecs on 2018. 02. 22..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import Foundation
import CoreBluetooth

class BluetoothClient: NSObject {

    var peripheralManager: CBPeripheralManager!
    var transferCharacteristic: CBMutableCharacteristic?
    var data = Data()
    var sendDataIndex: NSInteger = 0
    var sendingEOM = false

    static let shared = BluetoothClient()
    
    private override init() {
        super.init()
        
        self.peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }
    
    func stopAdvertising() {
        self.peripheralManager.stopAdvertising()
    }
    
    func startAdvertising() {
        self.peripheralManager.startAdvertising([CBAdvertisementDataServiceUUIDsKey: [BluetoothConfig.service]])
    }

    func sendData() {
        if self.sendingEOM {
            let didSend = self.peripheralManager.updateValue(BluetoothConfig.EOMData,
                                                             for: self.transferCharacteristic!,
                                                             onSubscribedCentrals: nil)
            if didSend {
                self.sendingEOM = false
            }
            return
        }
        
        if self.sendDataIndex >= self.data.count {
            return //no data left
        }
        
        var didSend = true
        
        while didSend {
            var amountToSend = self.data.count - self.sendDataIndex
            
            if amountToSend > 20 {
                amountToSend = 20
            }
            
            let chunk = Data() //NSData(bytes: self.data.bytes+self.sendDataIndex, length: amountToSend)
            didSend = self.peripheralManager.updateValue(chunk,
                                                         for: self.transferCharacteristic!,
                                                         onSubscribedCentrals: nil)
            
            if !didSend {
                return
            }
            
            let sentData = String(data: chunk, encoding: .utf8)!
            print(sentData)
            
            self.sendDataIndex += amountToSend
            
            if self.sendDataIndex >= self.data.count {
                self.sendingEOM = true
                let didSend     = self.peripheralManager.updateValue(BluetoothConfig.EOMData,
                                                                     for: self.transferCharacteristic!,
                                                                     onSubscribedCentrals: nil)
                if didSend {
                    self.sendingEOM = false
                }
                return
            }
        }
    }
    
}

extension BluetoothClient: CBPeripheralManagerDelegate {

    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        guard peripheral.state == .poweredOn else {
            return print("peripherial is not powered on")
        }
        
        self.transferCharacteristic = CBMutableCharacteristic(type: BluetoothConfig.characteristics,
                                                              properties: .notify,
                                                              value: nil,
                                                              permissions: .readable)
        
        let service = CBMutableService(type: BluetoothConfig.service, primary: true)
        
        service.characteristics = [self.transferCharacteristic!]
        
        self.peripheralManager.add(service)
        
        print("service added")
        
        self.startAdvertising()
    }
    func peripheralManager(_ peripheral: CBPeripheralManager,
                           central: CBCentral,
                           didSubscribeTo characteristic: CBCharacteristic) {
        print("central subscribed to characteristic")
        
        self.data            = "lorem ipsum".data(using: .utf8)!
        self.sendDataIndex    = 0
        self.sendingEOM        = false
        
        self.sendData()
    }
    
    func peripheralManagerIsReady(toUpdateSubscribers peripheral: CBPeripheralManager) {
        self.sendData()
    }
}
