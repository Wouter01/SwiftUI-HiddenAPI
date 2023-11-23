//
//  File.swift
//  
//
//  Created by Wouter on 23/11/23.
//

import SwiftUI
import SwiftUIHidden

struct WithCurrentWindowTestView: View {
    @Environment(\.hidden.withCurrentWindow) var withCurrentWindow
    
    var body: some View {
        Text("Hello")
            .task {
                withCurrentWindow { window in
                    guard let window else { return }
                    print("Hello from \(window.title)")
                }
            }
    }
}
