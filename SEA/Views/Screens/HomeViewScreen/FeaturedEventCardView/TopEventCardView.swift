//
//  TopEventCardView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 21/01/26.
//


import SwiftUI

struct TopEventCardView: View {

    let event: EventModel
    let onWishlistTap: () -> Void

    var body: some View {
        ZStack(alignment: .topTrailing) {

            Image(event.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 260, height: 160)
                .clipped()
                .cornerRadius(18)

            // Gradient Overlay
            LinearGradient(
                gradient: Gradient(colors: [.clear, .black.opacity(0.75)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .cornerRadius(18)

            // Wishlist Button
            Button(action: onWishlistTap) {
                Image(systemName: "heart")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(.black.opacity(0.5))
                    .clipShape(Circle())
            }
            .padding(10)

            // Bottom Content
            VStack(alignment: .trailing, spacing: 6) {

                Spacer()

                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)

                    Text("5.0")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(.black.opacity(0.6))
                .cornerRadius(8)

                Text(event.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .lineLimit(1)

                Text(event.location)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.85))
            }
            .padding()
        }
        .frame(width: 260, height: 160)
        .shadow(radius: 6)
    }
}
