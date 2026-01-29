//
//  EventsDetailsView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 24/01/26.
//

import SwiftUI

struct EventsDetailsView: View {
    let event: EventModel
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {

                // MARK: - Hero Image
                ZStack(alignment: .topTrailing) {
                    Image("SEAicon") // replace with real event image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .clipped()

                    HStack(spacing: 12) {
                        iconButton(systemName: "square.and.arrow.up")
                        iconButton(systemName: "heart")
                    }
                    .padding()
                }

                // MARK: - Event Info
                VStack(alignment: .leading, spacing: 16) {

                    HStack(alignment: .top) {
                        Text("Sanskar Night of Hilarious Comedy at the Club")
                            .font(.title2)
                            .fontWeight(.bold)

                        Spacer()

                        Text("₹1999")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.brightOrange)
                    }

                    // MARK: Meta Info
                    HStack(spacing: 16) {
                        metaItem(icon: "calendar", text: "Feb 15–17")
                        metaItem(icon: "location.fill", text: "Pune, MH")
                        metaItem(icon: "person.2.fill", text: "8k+")
                    }

                    Divider()

                    // MARK: - About Event
                    VStack(alignment: .leading, spacing: 8) {
                        Text("About Event")
                            .font(.headline)
                        
                        ReadMoreText(
                            text: "Planning an event can be daunting, especially when you have guests. We help you enjoy the celebration while we handle everything else.Expect laughter, great vibes, and unforgettable memories.",
                            lineLimit: 2
                        )
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }

                    // MARK: - Services / Highlights
                    VStack(alignment: .leading, spacing: 12) {
                        Text("What’s Included")
                            .font(.headline)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                serviceCard(title: "Live Comedy", icon: "mic.fill")
                                serviceCard(title: "Drinks", icon: "wineglass.fill")
                                serviceCard(title: "Music", icon: "music.note")
                                serviceCard(title: "Food", icon: "fork.knife")
                                serviceCard(title: "Parking", icon: "car")
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .padding(.bottom, 90)
        .overlay(alignment: .bottom) {
            buyTicketBar
        }
        .toolbar(.hidden, for: .tabBar)
    }
}


private extension EventsDetailsView {

    func iconButton(systemName: String) -> some View {
        Button {
            print("\(systemName) tapped")
        } label: {
            Image(systemName: systemName)
                .foregroundColor(.black)
                .padding(10)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(radius: 3)
        }
    }

    func metaItem(icon: String, text: String) -> some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
                .font(.caption)
            Text(text)
                .font(.caption)
        }
        .foregroundColor(.secondary)
    }

    func serviceCard(title: String, icon: String) -> some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.brightOrange)

            Text(title)
                .font(.caption)
                .fontWeight(.medium)
        }
        .frame(width: 90, height: 90)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }

    var buyTicketBar: some View {
        VStack(spacing: 0) {
            Divider()

            PrimaryButton(
                title: "Buy Ticket",
                backgroundColor: .brightOrange,
                titleColor: .white
            ) {
                print("Buy Ticket")
            }
            .padding(.horizontal)
            .padding(.top, 8)
            .padding(.bottom, 16) // 👈 safe-area feel
        }
        .background(.ultraThinMaterial)
    }

}
