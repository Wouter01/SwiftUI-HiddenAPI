//
//  Environment+extensions.swift
//  SwiftUI-HiddenAPI-Framework
//
//  Created by Wouter on 22/11/23.
//

import SwiftUI

extension EnvironmentValues {
    var hidden: HiddenEnvironmentValues {
        .init(environment: self)
    }
}

struct WithCurrentWindowAction {
    let action: SwiftUI.WithCurrentWindowAction
    
    public func callAsFunction(_ window: (NSWindow?) -> Void) {
        action(window)
    }
}

struct HiddenEnvironmentValues {
    let environment: EnvironmentValues
    
    var openSettings: () -> Void {
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
    
    var withCurrentWindow: WithCurrentWindowAction {
        .init(action: environment.withCurrentWindow)
    }
}
