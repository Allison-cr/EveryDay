//
//  SettingsShetView.swift
//  EveryDay
//
//  Created by Alexander Suprun on 18.06.2024.
//

import SwiftUI

struct SettingsSheetView: View {
    @ObservedObject var coordinator: SettingsCoordinator
    @Environment(\.colorScheme) var scheme
    @StateObject private var colorPickerViewModel = ColorPickerViewModel()

    var body: some View {
        switch coordinator.currentSheet {
        case .themeChange:
            ThemeChangeView(scheme: scheme)
        case .colorChange:
            ColorPickerButton(viewModel: colorPickerViewModel)
        case .none:
            EmptyView()
        }
    }
}
