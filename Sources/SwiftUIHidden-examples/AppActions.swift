//
//  File.swift
//  
//
//  Created by Wouter on 23/11/23.
//

import SwiftUI
import SwiftUIHidden

class AppActionsTestDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        AppActions.openSettings()
        AppActions.openWindow(id: "TestWindow")
    }
}
