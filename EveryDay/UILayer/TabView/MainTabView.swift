//
//  MainTabView.swift
//  EveryDay
//
//  Created by Alexander Suprun on 14.06.2024.
//
import SwiftUI

struct MainTabView: View {
    @ObservedObject var coordinator: MainTabCoordinator
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            ScheduleView()
            .tabItem {
                    Label("Home", systemImage: "rectangle.3.group.bubble")
                }
                .tag(MainTabCoordinator.Tab.schedule)
            TaskView()
                .tabItem {
                    Label("Task", systemImage: "list.dash.header.rectangle")
                }
                .tag(MainTabCoordinator.Tab.task)
            Text("Calendar")
                .tabItem {
                    Label("Calendar", systemImage: "list.dash.header.rectangle")
                }
                .tag(MainTabCoordinator.Tab.calendar)
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(MainTabCoordinator.Tab.settings)
        }
    }
}

#Preview {
    MainTabView(coordinator: MainTabCoordinator())
}
