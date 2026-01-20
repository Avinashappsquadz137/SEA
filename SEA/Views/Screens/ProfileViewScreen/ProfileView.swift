//
//  ProfileView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 17/01/26.
//

import SwiftUI

struct ProfileView: View {

    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {

                    // MARK: - Profile
                    SettingsSectionView(title: "Profile") {
                        SettingsRowView(
                            icon: "person",
                            title: "Edit profile",
                            action: viewModel.editProfile
                        )
                    }

                    // MARK: - Communication Preferences
                    SettingsSectionView(title: "Communication Preferences") {
                        ToggleRowView(
                            icon: "bell",
                            title: "Notifications",
                            subtitle: "Receive personalized notifications",
                            isOn: $viewModel.notificationsEnabled
                        )

                        ToggleRowView(
                            icon: "envelope",
                            title: "Email",
                            subtitle: "Receive account updates",
                            isOn: $viewModel.emailEnabled
                        )
                    }

                    // MARK: - Location
                    SettingsSectionView(title: "Location permission") {
                        ToggleRowView(
                            icon: "location",
                            title: "Enable My Location",
                            subtitle: "Used to improve your experience",
                            isOn: $viewModel.locationEnabled
                        )
                    }

                    // MARK: - Legal
                    SettingsSectionView(title: "Legal") {
                        SettingsRowView(
                            icon: "doc.text",
                            title: "Terms & Conditions",
                            action: viewModel.openTerms
                        )

                        SettingsRowView(
                            icon: "lock",
                            title: "Privacy Policy",
                            action: viewModel.openPrivacyPolicy
                        )
                    }
                }
                .padding()
            }
            //.background(Color.black.ignoresSafeArea())
            .navigationTitle("Account Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
