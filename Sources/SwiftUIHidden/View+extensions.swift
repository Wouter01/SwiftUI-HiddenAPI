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
    
    /// Apply a variable blur overlay to a view.
    public func variableBlur(maxRadius: CGFloat, mask: Image, opaque: Bool) -> some View {
        content.variableBlur(maxRadius: maxRadius, mask: mask, opaque: opaque)
    }
    
    /// Change the toolbar behavior when the window is fullscreen.
    /// `.showsWithWindow` is the default behavior. `.showsWithMenuBar` will hide the toolbar when fullscreen.
    @available(iOS, unavailable)
    public func fullScreenToolbarBehavior(_ behavior: FullScreenToolbarBehavior) -> some View {
        content.fullScreenToolbarBehavior(behavior.toOriginal)
    }
    
    /// Get a trigger when a row has been selected by the user, and gets clicked again.
    /// This differs from a TapGesture, as there is no time limit between the clicks.
    public func onReselect(enabled: Bool, perform: (() -> ())?) -> some View {
        content.onReselect(isEnabled: enabled, perform: perform)
    }
    
    /// Adjust the padding around a Form with FormStyle `.grouped`
    @available(macOS 13.0, *)
    public func formInsets(_ edges: Edge.Set, _ value: CGFloat) -> some View {
        content.formInsets(edges, value)
    }
    
    /// Adjust the padding around a Form with FormStyle `.grouped`
    @available(macOS 13.0, *)
    public func formInsets(_ edges: Edge.Set, _ value: EdgeInsets) -> some View {
        content.formInsets(edges, value)
    }
    
    /// Adjust the inset of an individual row in a Form with FormStyle `.grouped`
    @available(macOS 13.0, *)
    public func formRowInsets(_ insets: EdgeInsets?) -> some View {
        content.formRowInsets(insets)
    }
    
    /// Set the indentation level of a Form row.
    @available(macOS 13.0, *)
    @available(iOS, unavailable)
    public func formRowIndentationLevel(_ level: Int?) -> some View {
        content.formRowIndentationLevel(level)
    }
    
    /// Change the background color of a Form.
    @available(macOS 13.0, *)
    public func formBackground<S: ShapeStyle>(_ shape: S?) -> some View {
        content.formBackground(shape)
    }
    
    /// Change the background color of an individual row in a Form.
    @available(macOS 13.0, *)
    public func formRowBackground<S: ShapeStyle>(_ shape: S?) -> some View {
        content.formRowBackground(shape)
    }
    
    /// Change the background color of a section.
    @available(macOS 13.0, *)
    public func sectionBackground(_ visibility: Visibility) -> some View {
        content.sectionBackground(visibility)
    }
    
    /// Add a trailing info icon to a Form row.
    /// As an example, see system bluetooth settings.
    @available(macOS 13.0, *)
    @available(iOS, unavailable)
    public func formInfoAction(action: @escaping () -> Void) -> some View {
        content.formInfoAction(action: action)
    }
    
    /// Change the visibility of the trailing info icon in a Form row.
    @available(macOS 13.0, *)
    @available(iOS, unavailable)
    public func formRowInfoVisibility(_ visibility: Visibility) -> some View {
        content.formRowInfoVisibility(visibility)
    }
    
    /// Add a trailing Form row view, which becomes visible when hovered over the row.
    /// As an example, see system wifi settings.
    @available(macOS 13.0, *)
    @available(iOS, unavailable)
    public func formAccessory(@ViewBuilder accessories: () -> some View) -> some View {
        content.formAccessory(accessories: accessories)
    }
    
    /// Change the visibility of the trailing Form row view.
    @available(macOS 13.0, *)
    @available(iOS, unavailable)
    public func formAccessoryVisibility(_ visibility: Visibility) -> some View {
        content.formAccessoryVisibility(visibility)
    }
    
    /// Add a bottom row to a Table.
    @available(macOS 13.0, *)
    @available(iOS, unavailable)
    public func bottomBar(@ViewBuilder content: () -> some View) -> some View {
        self.content.bottomBar(content: content)
    }
    
    /// Add a sticky footer to List or Table. The List or Table needs to be wrapped in a Form with style `grouped`.
    @available(macOS 13.0, *)
    @available(iOS, unavailable)
    public func accessoryBar(@ViewBuilder content: () -> some View) -> some View {
        self.content.accessoryBar(content: content)
    }
    
    /// Control the visibility of the list reorder controls. Untested.
    public func listReorderControlVisibility(_ visibility: ListAccessoryVisibility) -> some View {
        content.listReorderControlVisibility(visibility.toOriginal)
    }
}
