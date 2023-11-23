//
//  File.swift
//  
//
//  Created by Wouter on 23/11/23.
//

import SwiftUI
import SwiftUIHidden

struct FloatingWindowStyleTestScene: Scene {
    var body: some Scene {
        WindowGroup {
            Text("Hello")
        }
        .windowStyle(.hidden.floating)
    }
}
