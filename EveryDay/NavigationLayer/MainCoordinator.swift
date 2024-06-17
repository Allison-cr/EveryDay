//
//  MainCoordinator.swift
//  EveryDay
//
//  Created by Alexander Suprun on 14.06.2024.
//
import SwiftUI
import Combine

class MainCoordinator: ObservableObject {
    @Published var isOnboardingActive: Bool
    
    var onboardingCoordinator: OnboardingCoordinator
    
    init() {
        self.onboardingCoordinator = OnboardingCoordinator()
        if AppUsageManager.shared.isFirstLaunch() {
            self.isOnboardingActive = true
        } else {
            self.isOnboardingActive = false
        }
        
        self.onboardingCoordinator.$isOnboardingFinished
            .sink { [weak self] finished in
                if finished {
                    AppUsageManager.shared.setFirstLaunchCompleted()
                    self?.isOnboardingActive = false
                }
            }
            .store(in: &cancellables)
    }
    
    private var cancellables = Set<AnyCancellable>()
}
