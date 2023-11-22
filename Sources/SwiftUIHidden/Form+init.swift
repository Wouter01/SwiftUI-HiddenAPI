//
//  Form+init.swift
//  SwiftUI-HiddenAPI-Framework
//
//  Created by Wouter on 22/11/23.
//

import SwiftUI

public extension Form {
    static func withFooter<C: View, F: View>(@ViewBuilder content: () -> C, @ViewBuilder footer: () -> F) -> some View {
        Form<FormFooterContent<C, F>>(content: content, footer: footer)
    }
}
