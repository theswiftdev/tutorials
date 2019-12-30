//
//  BluetoothServer.swift
//  Networking
//
//  Created by Tibor Bödecs on 2018. 02. 22..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import Foundation
import CoreBluetooth

class BluetoothServer: NSObject {
    
    var manager: CBCentralManager!
    var peripheral: CBPeripheral?
    var data = Data()

    static let shared = BluetoothServer()
    
    private override init() {
        super.init()
        
    }
    
    func start() {
        self.manager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func scanForPheripherals() {
        print("scanning for peripherals...")
        
        self.manager.scanForPeripherals(withServices: [BluetoothConfig.service],
                                        options: [CBCentralManagerScanOptionAllowDuplicatesKey: true])
    }
    
    func stopScan() {
        self.manager.stopScan()
    }
    
    func cleanup() {
        for service in (self.peripheral?.services)! {
            for characteristic in service.characteristics! {
                if characteristic.uuid == BluetoothConfig.characteristics && characteristic.isNotifying {
                    self.peripheral?.setNotifyValue(false, for: characteristic)
                }
            }
        }
        self.manager.cancelPeripheralConnection(self.peripheral!)
    }
}

extension BluetoothServer: CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        guard central.state == .poweredOn else {
            return print("manager is not powered on")
        }
        self.scanForPheripherals()
    }
    
    func centralManager(_ central: CBCentralManager,
                        didDiscover peripheral: CBPeripheral,
                        advertisementData: [String : Any],
                        rssi RSSI: NSNumber) {
        // Reject any where the value is above reasonable range
        //        if RSSI.integerValue > -15 {
        //            return
        //        }
        // Reject if the signal strength is too low to be close enough (Close is around -22dB)
        //        if RSSI.integerValue < -35 {
        //            return
        //        }
        
        if self.peripheral != peripheral {
            self.peripheral = peripheral
            print("connecting to peripheral...")
            self.manager.connect(self.peripheral!, options: nil)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        guard self.peripheral == peripheral else {
            return print("could not connect to peripheral")
        }
        
        print("connected: \(peripheral.name ?? "n/a")")
        
        self.stopScan()
        self.data.count = 0
        peripheral.delegate = self
        peripheral.discoverServices([BluetoothConfig.service])
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        guard self.peripheral == peripheral else {
            return  print("could not disconnect to peripheral")
        }
        
        print("disconnected: \(peripheral.name ?? "n/a")")
        self.peripheral = nil
        self.scanForPheripherals()
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("connection failed: \(error?.localizedDescription ?? "n/a")")
        self.cleanup()
    }
}

extension BluetoothServer: CBPeripheralDelegate {
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard self.peripheral == peripheral && error == nil else {
            print("error discovering service: \(error?.localizedDescription ?? "n/a")")
            self.cleanup()
            return
        }
        for service in peripheral.services ?? [] {
            peripheral.discoverCharacteristics([BluetoothConfig.characteristics], for: service)
        }
    }
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard self.peripheral == peripheral && error == nil else {
            print("error discovering service: \(error?.localizedDescription ?? "n/a")")
            self.cleanup()
            return
        }
        for characteristics in service.characteristics ?? [] {
            if characteristics.uuid == BluetoothConfig.characteristics {
                self.peripheral!.setNotifyValue(true, for: characteristics)
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        guard self.peripheral == peripheral && error == nil else {
            print("error discovering service: \(error?.localizedDescription ?? "n/a")")
            self.cleanup()
            return
        }
        
        let string = String(data: characteristic.value!, encoding: .utf8)!
        
        if string == BluetoothConfig.EOM {
            let string = String(data: self.data, encoding: .utf8)!
            
            print("\(string)")
            
            self.peripheral?.setNotifyValue(false, for: characteristic)
            self.manager.cancelPeripheralConnection(peripheral)
        }
        self.data.append(characteristic.value!)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        if characteristic.uuid != BluetoothConfig.characteristics {
            return
        }
        if characteristic.isNotifying {
            print("notif begin on \(characteristic)")
        }
        else {
            self.manager.cancelPeripheralConnection(peripheral)
        }
    }
}








