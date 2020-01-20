//
//  AppDelegate.swift
//  LauncherApplication
//
//  Created by Tibor Bodecs on 2015. 09. 17..
//  Copyright © 2015. Tibor Bodecs. All rights reserved.
//

import Cocoa

extension Notification.Name {
    static let killLauncher = Notification.Name("killLauncher")
}

@NSApplicationMain
class AppDelegate: NSObject {

	@objc func terminate() {
		NSApp.terminate(nil)
	}
}

extension AppDelegate: NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
	let mainAppIdentifier = "com.tiborbodecs.MainApplication"
        let runningApps = NSWorkspace.shared.runningApplications
        let isRunning = !runningApps.filter { $0.bundleIdentifier == mainAppIdentifier }.isEmpty
        
        if !isRunning {
            DistributedNotificationCenter.default().addObserver(self, 
								selector: #selector(self.terminate), 
								name: .killLauncher, 
								object: mainAppIdentifier)
            
            let url = URL(fileURLWithPath: Bundle.main.bundlePath).deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
            let path = url.appendingPathComponent("MacOS").appendingPathComponent("MainApplication").path

            if #available(OSX 10.15, *) {
                NSWorkspace.shared.openApplication(at: url, 
						   configuration: NSWorkspace.OpenConfiguration(), 
						   completionHandler: nil)
            } else {
                NSWorkspace.shared.launchApplication(path)
            }
        }
        else {
            self.terminate()
        }
    }
	
}

