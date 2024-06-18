//
//  SettingsView.swift
//  EveryDay
//
//  Created by Alexander Suprun on 16.06.2024.
//
import SwiftUI

struct SettingsView: View {
    @ObservedObject private var settingsCoordinator = SettingsCoordinator()
    
    var body: some View {
        NavigationStack {
            List {
                Section("Appearance") {
                    Button("Change Theme") {
                        settingsCoordinator.presentSheet(.themeChange)
                    }
                    Button("Change App Color") {
                        settingsCoordinator.presentSheet(.colorChange)
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .sheet(isPresented: $settingsCoordinator.isSettingsSheetPresented) {
            SettingsSheetView(coordinator: settingsCoordinator)
                .presentationDetents([.height(410)])
                .presentationBackground(.clear)
        }
    }
}

#Preview {
    SettingsView()
}
