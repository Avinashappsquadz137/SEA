//
//  HomeView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 17/01/26.
//

import SwiftUI

struct EventModel: Identifiable {
    let id = UUID()
    let title: String
    let location: String
    let date: String
    let attendees: String
    let price: String
    let imageName: String
}
struct HomeView: View {
    let featuredEvents: [EventModel] = [
        EventModel(
            title: "Sunburn Festival 2026",
            location: "Goa, India",
            date: "Jan 25–27",
            attendees: "15,000 attending",
            price: "₹2999",
            imageName: "SEAicon"
        ),
        EventModel(
            title: "NH7 Weekender",
            location: "Pune, India",
            date: "Feb 10–12",
            attendees: "10,000 attending",
            price: "₹1999",
            imageName: "SEAicon"
        )
    ]

    var body: some View {
        VStack(spacing: 0) {
            AppHeaderView(
                userName: "AVINASH",
                onWalletTap: {
                    print("Wallet tapped")
                },
                onNotificationTap: {
                    print("Notification tapped")
                }
            )
            ScrollView {
                HomeSearchSectionView()
                
                VStack(alignment: .leading, spacing: 16) {

                    Text("Featured Events")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    ForEach(featuredEvents.prefix(2)) { event in
                        FeaturedEventCardView(
                            event: event,
                            onWishlistTap: {
                                print("Wishlist tapped for \(event.title)")
                            }
                        )
                    }
                }
                TopEventsSectionView(
                       title: "Top 10 Events of 2026",
                       events: featuredEvents,
                       onSeeAllTap: {
                           print("Navigate to Top 10 list")
                       }
                   )
                MostPopularSectionView(
                    events: featuredEvents
                ) { event in
                    print("Wishlist tapped for \(event.title)")
                }

            }
            .padding(.vertical)
            Divider()
        }
        .overlay(ToastView())
        .background(Color(.systemGroupedBackground))
    }
}
