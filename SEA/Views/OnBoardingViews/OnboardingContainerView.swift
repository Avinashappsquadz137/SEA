//
//  OnboardingContainerView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 17/01/26.
//
import SwiftUI

struct OnboardingContainerView: View {

    @State private var currentPage = 0
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        VStack {

            TabView(selection: $currentPage) {

                OnboardingPage(
                    title: "Welcome",
                    description: "Explore Upcoming and Nearby Events",
                    image: "star.fill"
                )
                .tag(0)

                OnboardingPage(
                    title: "Explore",
                    description: "Create and Find Events Easily in One Place",
                    image: "globe"
                )
                .tag(1)

                OnboardingPage(
                    title: "Get Started",
                    description: "Watching Free Concerts with Friends",
                    image: "rocket.fill"
                )
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle())

            PrimaryButton(
                title: currentPage == 2 ? "Get Started" : "Next",
                backgroundColor: Color.btnOrange,
                titleColor:.white
            ) {
                if currentPage == 2 {
                    hasSeenOnboarding = true
                } else {
                    withAnimation {
                        currentPage += 1
                    }
                }
            }
            .padding()
        }
    }
}


struct OnboardingPage: View {

    let title: String
    let description: String
    let image: String

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Image(systemName: image)
                .font(.system(size: 80))
                .foregroundColor(.blue)

            Text(title)
                .font(.title)
                .bold()

            Text(description)
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()
        }
        .padding()
    }
}
