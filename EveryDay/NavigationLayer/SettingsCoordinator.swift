//
//  SettingsCoordinator.swift
//  EveryDay
//
//  Created by Alexander Suprun on 18.06.2024.
//
import SwiftUI

enum SettingsSheet {
    case themeChange
    case colorChange
}

class SettingsCoordinator: ObservableObject {
    @Published var isSettingsSheetPresented: Bool = false
    @Published var currentSheet: SettingsSheet? = nil

    func presentSheet(_ sheet: SettingsSheet) {
        currentSheet = sheet
        isSettingsSheetPresented = true
    }

    func dismissSheet() {
        isSettingsSheetPresented = false
        currentSheet = nil
    }
}
