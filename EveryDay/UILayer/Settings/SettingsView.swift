//
//  SettingsView.swift
//  EveryDay
//
//  Created by Alexander Suprun on 16.06.2024.
//
import SwiftUI

struct SettingsView: View {
    @State private var changeTheme: Bool = false
    @Environment(\.colorScheme) private var  scheme
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    var body: some View {
        NavigationStack {
            List {
                Section("Apperance") {
                    Button("Change Theme") {
                        changeTheme.toggle()
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .preferredColorScheme(userTheme.colorScheme)
        .sheet(isPresented: $changeTheme, content: {
            ThemeChangeView(scheme: scheme)
            
                .presentationDetents([.height(410)])
                .presentationBackground(.clear)
        })
    }
}

#Preview {
    SettingsView()
}
