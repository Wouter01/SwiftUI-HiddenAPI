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
    
    /// Customize the window background. Use `.clear` for a transparent window, use `.*Material` for a blurred background
    public func windowBackground(_ shape: some ShapeStyle) -> some Scene {
        content.windowBackground(shape)
    }
    
    /// Disable automatic window opening behavior..
    /// For example, when set to `.hidden`, launching the app or clicking the app icon won't create a new window of that scene.
    /// Note that previously created windows may reappear.
    public func defaultVisibility(_ visibility: Visibility) -> some Scene {
        content.defaultVisibility(visibility)
    }
    
    /// Determine if a window should be closed when the user tries to close the window.
    /// Returning `true` will close the window, `false` will keep the window open.
    public func windowShouldClose(_ perform: @escaping () -> Bool) -> some Scene {
        content.windowShouldClose(perform)
    }
}
