//
//  View+extensions.swift
//  SwiftUI-HiddenAPI-Framework
//
//  Created by Wouter on 21/11/23.
//

import SwiftUI

public extension View {
    var hidden: HiddenViewModifier<Self> {
        .init(content: self)
    }
}

public enum FullScreenToolbarBehavior {
    case showsWithWindow, showsWithMenuBar, automatic
    
    
    var toOriginal: SwiftUI.FullScreenToolbarBehavior {
        switch self {
        case .showsWithWindow: .showsWithWindow
        case .showsWithMenuBar: .showsWithMenuBar
        case .automatic: .automatic
        }
    }
}

public enum ListAccessoryVisibility {
    case always, editing, automatic
    
    var toOriginal: SwiftUI.ListAccessoryVisibility {
        switch self {
        case .always: .always
        case .editing: .editing
        case .automatic: .automatic
        }
    }
}


public struct HiddenViewModifier<Content: View> {
    let content: Content
    
    public func fullScreenToolbarBehavior(_ behavior: FullScreenToolbarBehavior) -> some View {
        content.fullScreenToolbarBehavior(behavior.toOriginal)
    }
    
    public func formInsets(_ edges: Edge.Set, _ value: CGFloat) -> some View {
        content.formInsets(edges, value)
    }
    
    public func formInsets(_ edges: Edge.Set, _ value: EdgeInsets) -> some View {
        content.formInsets(edges, value)
    }
    
    public func onReselect(enabled: Bool, perform: (() -> ())?) -> some View {
        content.onReselect(isEnabled: enabled, perform: perform)
    }
    
    public func variableBlur(maxRadius: CGFloat, mask: Image, opaque: Bool) -> some View {
        content.variableBlur(maxRadius: maxRadius, mask: mask, opaque: opaque)
    }
    
    public func formBackground<S: ShapeStyle>(_ shape: S?) -> some View {
        content.formBackground(shape)
    }
    
    public func formRowBackground<S: ShapeStyle>(_ shape: S?) -> some View {
        content.formRowBackground(shape)
    }
    
    public func formInfoAction(action: @escaping () -> Void) -> some View {
        content.formInfoAction(action: action)
    }
    
    public func sectionBackground(_ visibility: Visibility) -> some View {
        content.sectionBackground(visibility)
    }
    
    public func formRowInfoVisibility(_ visibility: Visibility) -> some View {
        content.formRowInfoVisibility(visibility)
    }
    
    public func formRowIndentationLevel(_ level: Int?) -> some View {
        content.formRowIndentationLevel(level)
    }
    
    public func formAccessory(@ViewBuilder accessories: () -> some View) -> some View {
        content.formAccessory(accessories: accessories)
    }
    
    public func formRowInsets(_ insets: EdgeInsets?) -> some View {
        content.formRowInsets(insets)
    }
    
    public func formAccessoryVisibility(_ visibility: Visibility) -> some View {
        content.formAccessoryVisibility(visibility)
    }
    
    public func listReorderControlVisibility(_ visibility: ListAccessoryVisibility) -> some View {
        content.listReorderControlVisibility(visibility.toOriginal)
    }
    
    public func bottomBar(@ViewBuilder content: () -> some View) -> some View {
        self.content.bottomBar(content: content)
    }
    
    /// Add a sticky footer to List or Table. The List or Table needs to be wrapped in a Form with style `grouped`.
    public func accessoryBar(@ViewBuilder content: () -> some View) -> some View {
        self.content.accessoryBar(content: content)
    }
    
}
