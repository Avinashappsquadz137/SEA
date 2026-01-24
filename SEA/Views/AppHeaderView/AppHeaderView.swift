//
//  AppHeaderView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 20/01/26.
//


import SwiftUI

struct AppHeaderView: View {

    let userName: String
    let onWalletTap: () -> Void
    let onNotificationTap: () -> Void

    var body: some View {
        HStack(spacing: 12) {

            // Avatar
            Circle()
                .fill(LinearGradient(
                    colors: [.purple, .pink],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .frame(width: 44, height: 44)
                .overlay(
                    Text(String(userName.prefix(1)))
                        .foregroundColor(.white)
                        .font(.headline)
                )

            // Welcome Text
            VStack(alignment: .leading, spacing: 4) {
                Text(userName)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                LocationSelectorView(
                    locationName: "Noida",
                    onChangeTap: {
                        print("Change location tapped")
                    }
                )
            }


            Spacer()

            // Wallet Button
            Button(action: onWalletTap) {
                Image(systemName: "wallet.pass")
                    .font(.title3)
            }

            // Notification Button
            Button(action: onNotificationTap) {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "bell")
                        .font(.title3)

                    Circle()
                        .fill(Color.red)
                        .frame(width: 8, height: 8)
                        .offset(x: 6, y: -6)
                }
            }
        }
        .padding(5)
        .padding(.horizontal)
        .background(Color.white)
    }
}
