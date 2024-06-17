//
//  OnboardingPageView.swift
//  EveryDay
//
//  Created by Alexander Suprun on 14.06.2024.
//
import SwiftUI

struct OnboardingPageView: View {
    var backgroundColor: Color
    var text: String
    
    var body: some View {
        ZStack {
            Color(backgroundColor)
            VStack {
                Spacer()
                Text(text)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingPageView(backgroundColor: .blue, text: "asdf")
}
