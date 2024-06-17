//
//  OnboardingCoordinator.swift
//  EveryDay
//
//  Created by Alexander Suprun on 14.06.2024.
//
import SwiftUI

class OnboardingCoordinator: ObservableObject {
    @Published var currentPage: Int = 0
    @Published var isOnboardingFinished: Bool = false
    
    let pages: [AnyView]
    
    init() {
        self.pages = [
            AnyView(OnboardingPageView(backgroundColor: .purple, text: "Welcome to the app!")),
            AnyView(OnboardingPageView(backgroundColor: .yellow, text: "Learn how to use the app.")),
            AnyView(OnboardingPageView(backgroundColor: .green, text: "Start using the app!"))
        ]
    }
    
    func nextPage() {
        if currentPage < pages.count - 1 {
            currentPage += 1
        } else {
            finishOnboarding()
        }
    }
    
    private func finishOnboarding() {
        isOnboardingFinished = true
    }
}
