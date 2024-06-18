//
//  SettingsShetView.swift
//  EveryDay
//
//  Created by Alexander Suprun on 18.06.2024.
//

import SwiftUI

struct SettingsSheetView: View {
    @ObservedObject var coordinator: SettingsCoordinator
    @Environment(\.colorScheme) private var scheme
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    @StateObject private var colorPickerViewModel = ColorPickerViewModel()

    var body: some View {
        switch coordinator.currentSheet {
        case .themeChange:
            ThemeChangeView(scheme: scheme)
                .preferredColorScheme(userTheme.colorScheme)
        case .colorChange:
            ColorPickerButton(viewModel: colorPickerViewModel)
        case .none:
            EmptyView()
        }
    }
}
