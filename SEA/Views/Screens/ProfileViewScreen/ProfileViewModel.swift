//
//  ProfileViewModel.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 19/01/26.
//
import SwiftUI
import Combine

final class ProfileViewModel: ObservableObject {

    // MARK: - Published States
    @Published var notificationsEnabled: Bool = true
    @Published var emailEnabled: Bool = true
    @Published var locationEnabled: Bool = false

    // MARK: - Actions
    func editProfile() {
        print("Edit profile tapped")
    }

    func openTerms() {
        print("Terms & Conditions")
    }

    func openPrivacyPolicy() {
        print("Privacy Policy")
    }
    
    func myTickets() {
        print("My Tickets")
    }
    
    func myFavourite() {
        print("My Favourite")
    }
}

struct SettingsSectionView<Content: View>: View {

    let title: String
    let content: Content

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundColor(.black)

            VStack(spacing: 8) {
                content
            }
        }
    }
}
struct SettingsRowView: View {

    let icon: String
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.black)

                Text(title)
                    .foregroundColor(.black)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
        }
    }
}
struct ToggleRowView: View {

    let icon: String
    let title: String
    let subtitle: String
    @Binding var isOn: Bool

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.black)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .foregroundColor(.black)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.black)
            }

            Spacer()

            Toggle("", isOn: $isOn)
                .labelsHidden()
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
    }
}
