//
//  FeaturedEventCardView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 21/01/26.
//


import SwiftUI

struct FeaturedEventCardView: View {

    let event: EventModel
    let onWishlistTap: () -> Void

    var body: some View {
        ZStack(alignment: .top) {

            // Background Image
            Image(event.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 280)
                .clipped()

            // Dark Gradient Overlay
            LinearGradient(
                colors: [.clear, .black.opacity(0.85)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack {

                // Top Row
                HStack {
                    Text(event.date)
                        .font(.caption)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.white)
                        .cornerRadius(16)

                    Spacer()

                    Button(action: onWishlistTap) {
                        Image(systemName: "heart")
                            .foregroundColor(.black)
                            .padding(10)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                }
                .padding()

                Spacer()

                // Bottom Content
                VStack(alignment: .leading, spacing: 8) {

                    Text(event.title)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    HStack(spacing: 6) {
                        Image(systemName: "location.fill")
                        Text(event.location)
                    }
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.9))

                    HStack {
                        HStack(spacing: 6) {
                            Image(systemName: "person.2.fill")
                            Text(event.attendees)
                        }
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.9))

                        Spacer()

                        Text(event.price)
                            .font(.headline)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 6)
                            .background(Color.black.opacity(0.7))
                            .foregroundColor(.white)
                            .cornerRadius(18)
                    }
                }
                .padding()
            }
        }
        .cornerRadius(24)
        .padding(.horizontal)
    }
}
