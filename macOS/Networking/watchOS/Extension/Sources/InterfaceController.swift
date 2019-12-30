//
//  InterfaceController.swift
//  watchOS Extension
//
//  Created by Tibor Bödecs on 2018. 02. 22..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import WatchKit
import WatchConnectivity
import Foundation

class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        super.willActivate()
        
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    @IBAction func buttonTouchedAction(sender: AnyObject) {
        let data = ["counterValue": "1"]
        WCSession.default.sendMessage(data, replyHandler: { something in
            print("\(something)")
        }) { error in
            print(error.localizedDescription)
        }
    }
}

extension InterfaceController: WCSessionDelegate {
    
}
