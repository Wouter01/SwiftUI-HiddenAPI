//
//  Form+init.swift
//  SwiftUI-HiddenAPI-Framework
//
//  Created by Wouter on 22/11/23.
//

import SwiftUI

public extension Form {
    /// Add a footer to a form.
    @available(macOS 13.0, iOS 16.0, *)
    @available(iOS, unavailable)
    static func withFooter<C: View, F: View>(@ViewBuilder content: () -> C, @ViewBuilder footer: () -> F) -> some View {
        Form<FormFooterContent<C, F>>(content: content, footer: footer)
    }
}
