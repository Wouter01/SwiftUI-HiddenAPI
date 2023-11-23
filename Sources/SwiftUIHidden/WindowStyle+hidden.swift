//
//  WindowStyle+hidden.swift
//  SwiftUI-HiddenAPI-Framework
//
//  Created by Wouter on 22/11/23.
//

import SwiftUI

@available(iOS, unavailable)
public struct HiddenWindowStyle: WindowStyle {
    public typealias _Body = Never
    
    public var floating: some WindowStyle {
        FloatingPanelWindowStyle()
    }
}

@available(iOS, unavailable)
public extension WindowStyle where Self == HiddenWindowStyle {
    static var hidden: HiddenWindowStyle {
        .init()
    }
}
