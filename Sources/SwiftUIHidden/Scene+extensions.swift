//
//  Scene+extensions.swift
//  SwiftUI-HiddenAPI-Framework
//
//  Created by Wouter on 22/11/23.
//

import SwiftUI

public extension Scene {
    var hidden: HiddenSceneModifier<Self> {
        .init(content: self)
    }
}

public struct HiddenSceneModifier<S: Scene> {
    let content: S
    
    public func windowBackground(_ shape: some ShapeStyle) -> some Scene {
        content.windowBackground(shape)
    }
    
    public func defaultVisibility(_ visibility: Visibility) -> some Scene {
        content.defaultVisibility(visibility)
    }
    
    public func windowShouldClose(_ perform: @escaping () -> Bool) -> some Scene {
        content.windowShouldClose(perform)
    }
}
