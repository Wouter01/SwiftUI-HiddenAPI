//
//  Support.swift
//  SwiftUI-HiddenAPI-Framework
//
//  Created by Wouter on 21/11/23.
//

import SwiftUI

public extension SwiftUI.App {
    static func openSettings() {
        if #available(macOS 14.0, *) {
            EnvironmentValues().openSettings()
        } else if #available(macOS 13.0, *) {
            NSApp.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil)
        } else {
            NSApp.sendAction(Selector(("showPreferencesWindow:")), to: nil, from: nil)
        }
    }
    
    @available(macOS 13.0, *)
    static func openWindow(id: String) {
        EnvironmentValues().openWindow(id: id)
    }
    
    @available(macOS 13.0, *)
    static func openWindow<Value: Codable & Hashable>(id: String, value: Value) {
        EnvironmentValues().openWindow(id: id, value: value)
    }
    
    @available(macOS 13.0, *)
    static func openWindow<Value: Codable & Hashable>(value: Value) {
        EnvironmentValues().openWindow(value: value)
    }
    
    @available(macOS 13.0, *)
    static func openDocument(at url: URL) async throws {
        try await EnvironmentValues().openDocument(at: url)
    }
    
    static func openURL(_ url: URL) {
        EnvironmentValues().openURL(url)
    }
    
    static func openURL(_ url: URL) async -> Bool {
        await withCheckedContinuation {
            EnvironmentValues().openURL(url, completion: $0.resume(returning:))
        }
    }
}
