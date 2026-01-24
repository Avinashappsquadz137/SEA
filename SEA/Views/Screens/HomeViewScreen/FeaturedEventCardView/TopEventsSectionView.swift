//
//  TopEventsSectionView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 21/01/26.
//


import SwiftUI

struct TopEventsSectionView: View {

    let title: String
    let events: [EventModel]
    let onSeeAllTap: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            // Header
            HStack {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)

                Spacer()

                Button(action: onSeeAllTap) {
                    Text("See All >")
                        .font(.subheadline)
                        .foregroundColor(.purple)
                }
            }
            .padding(.horizontal)

            // Horizontal Cards
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(events) { event in
                        TopEventCardView(
                            event: event,
                            onWishlistTap: {
                                print("Wishlist tapped: \(event.title)")
                            }
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
