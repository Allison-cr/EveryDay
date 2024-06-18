//
//  Ext + View.swift
//  EveryDay
//
//  Created by Alexander Suprun on 18.06.2024.
//

import Foundation
import SwiftUI

extension View {
    func customTitleStyle(colors: [Color]) -> some View {
        self.modifier(CustomTitleModifier(colors: colors))
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.scaleEffect(
            configuration.isPressed ? 1.5 : 1)
    }
}

struct CustomTitleModifier: ViewModifier {
    let colors: [Color]
    func body(content: Content) -> some View {
        content
            .font(.system(.largeTitle, design: .rounded))
            .fontWeight(.bold)
            .foregroundStyle(LinearGradient(
                colors: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing))
    }
}

#Preview {
    Text("Hello, World!")
        .customTitleStyle(colors: [.red, .green, .blue])
        .padding()
}
