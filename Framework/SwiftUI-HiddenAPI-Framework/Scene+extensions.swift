//
//  Scene+extensions.swift
//  SwiftUI-HiddenAPI-Framework
//
//  Created by Wouter on 22/11/23.
//

import SwiftUI

extension Scene {
    var hidden: HiddenSceneModifier<Self> {
        .init(content: self)
    }
}

struct HiddenSceneModifier<S: Scene> {
    let content: S
    
    func windowBackground(_ shape: some ShapeStyle) -> some Scene {
        content.windowBackground(shape)
    }
    
    func defaultVisibility(_ visibility: Visibility) -> some Scene {
        content.defaultVisibility(visibility)
    }
    
    func windowShouldClose(_ perform: @escaping () -> Bool) -> some Scene {
        content.windowShouldClose(perform)
    }
}
