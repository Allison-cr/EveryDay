//
//  OnboardingView.swift
//  EveryDay
//
//  Created by Alexander Suprun on 14.06.2024.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    @ObservedObject var coordinator: OnboardingCoordinator
    @StateObject private var tabCoordinator = MainTabCoordinator()

    var body: some View {
        ZStack {
            TabView(selection: $coordinator.currentPage) {
                ForEach(0..<coordinator.pages.count, id: \.self) { index in
                    coordinator.pages[index]
                        .tag(index)
                }
            }
            .ignoresSafeArea()
            .tabViewStyle(PageTabViewStyle())
            VStack {
                Spacer()
                Button(action: {
                    coordinator.nextPage()
                }) {
                    Text(coordinator.currentPage < coordinator.pages.count - 1 ? "Next" : "Finish")
                        .font(.headline)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 64)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}

