//
//  SEAApp.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 17/01/26.
//

import SwiftUI

@main
struct SEAApp: App {

    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
            } else {
                if hasSeenOnboarding {
                    MainTabBarView() //ContentView()
                } else {
                    OnboardingContainerView()
                }
            }
        }
    }
}

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Spacer()

           Image("SEAicon")
                .font(.system(size: 60))
                .foregroundColor(.blue)

            Text("SEA App")
                .font(.largeTitle)
                .bold()

            Spacer()
        }
    }
}

