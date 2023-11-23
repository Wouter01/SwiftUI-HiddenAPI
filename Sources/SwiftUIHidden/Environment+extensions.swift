//
//  Environment+extensions.swift
//  SwiftUI-HiddenAPI-Framework
//
//  Created by Wouter on 22/11/23.
//

import SwiftUI

public extension EnvironmentValues {
    var hidden: HiddenEnvironmentValues {
        .init(environment: self)
    }
}

@available(iOS, unavailable)
public struct WithCurrentWindowAction {
    let action: SwiftUI.WithCurrentWindowAction
    
    #if os(macOS)
    public func callAsFunction(_ window: (NSWindow?) -> Void) {
        action(window)
    }
    #endif
}

public struct HiddenEnvironmentValues {
    let environment: EnvironmentValues
    
    #if os(macOS)
    /// Open SwiftUI Settings.
    public var openSettings: () -> Void {
        if #available(macOS 14.0, *) {
            environment.openSettings.callAsFunction
        } else if #available(macOS 13.0, *) {
            {
                NSApp.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil)
            }
        } else {
            {
                NSApp.sendAction(Selector(("showPreferencesWindow:")), to: nil, from: nil)
            }
        }
    }
    #endif
    
    /// Access the current window.
    @available(iOS, unavailable)
    public var withCurrentWindow: WithCurrentWindowAction {
        .init(action: environment.withCurrentWindow)
    }
}
