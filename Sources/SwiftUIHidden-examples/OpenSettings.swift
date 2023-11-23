//
//  File.swift
//  
//
//  Created by Wouter on 23/11/23.
//

import SwiftUI
import SwiftUIHidden

struct OpenSettingsTestView: View {
    @Environment(\.hidden.openSettings) var openSettings
    
    var body: some View {
        Button("Open Settings") {
            openSettings()
        }
        Form {
            List {
                Text("Hello")
            }
            .hidden.accessoryBar {
                HStack(spacing: .zero) {
                    Button("Add", systemImage: "plus") {}
                    Divider()
                    Button("Remove", systemImage: "minus") {}
                }
            }
        }
        .formStyle(.grouped)
    }
}
