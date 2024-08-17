//
//  OnboardingView.swift
//  Assignment2
//
//  Created by RENANYANG on 2024-08-16.
//

//import Foundation
import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false

    var body: some View {
        VStack {
            Text("Welcome to the Employee Directory!")
                .font(.largeTitle)
                .padding()

            Button(action: {
                hasSeenOnboarding = true
            }) {
                Text("Get Started")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

