//
//  ContentView.swift
//  EveryDay
//
//  Created by Alexander Suprun on 14.06.2024.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @StateObject private var mainCoordinator = MainCoordinator()
    @StateObject private var tabCoordinator = MainTabCoordinator()

    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault

    var body: some View {
        let defaultTheme: Theme = defaultThemeForDevice()

        Group {
            if mainCoordinator.isOnboardingActive {
                OnboardingView(coordinator: mainCoordinator.onboardingCoordinator)
                    .preferredColorScheme(userTheme.colorScheme ?? defaultTheme.colorScheme ?? .light)
            } else {
                MainTabView(coordinator: tabCoordinator)
                    .preferredColorScheme(userTheme.colorScheme ?? defaultTheme.colorScheme ?? .light)
            }
        }
    }

    private func defaultThemeForDevice() -> Theme {
        let currentDeviceColorScheme = UIScreen.main.traitCollection.userInterfaceStyle
        return currentDeviceColorScheme == .dark ? .dark : .light
    }
}
