//
//  MostPopularSectionView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 24/01/26.
//
import SwiftUI

struct MostPopularSectionView: View {
    let events: [EventModel]
    var onWishlistTap: (EventModel) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            Text("Most Popular")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.horizontal)

            ForEach(events) { event in
                PopularEventCardView(
                    event: event,
                    onWishlistTap: {
                        onWishlistTap(event)
                    }
                )
            }
        }
    }
}
