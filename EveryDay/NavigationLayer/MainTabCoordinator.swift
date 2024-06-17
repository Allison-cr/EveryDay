//
//  TabBar.swift
//  EveryDay
//
//  Created by Alexander Suprun on 14.06.2024.
//
import SwiftUI

class MainTabCoordinator: ObservableObject {
    @Published var selectedTab: Tab = .schedule
    
    enum Tab {
        case schedule
        case calendar
        case task
        case settings
    }
    
    func selectTab(_ tab: Tab) {
        selectedTab = tab
    }
}           
