//
//  EventsDetailsView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 24/01/26.
//

import SwiftUI
struct TicketType: Identifiable {
    let id = UUID()
    let name: String
    let price: Int
    let perks: [String]
    var quantity: Int = 0
}

struct EventsDetailsView: View {
    let event: EventModel
    @State private var showLogin = false
    @State private var showPayment = false
    @EnvironmentObject var authManager: AuthManager
    
    @State private var tickets: [TicketType] = [
        TicketType(name: "Silver", price: 999, perks: ["General Seating"]),
        TicketType(name: "Gold", price: 1499, perks: ["Front Rows", "Free Drink"]),
        TicketType(name: "Premium", price: 1999, perks: ["VIP Seating", "2 Drinks", "Meet & Greet"])
    ]
    let mediaItems: [EventMedia] = [
        .image(name: "Image1"),
        .video(url: URL(string: "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.mp4/.m3u8")!),
        .image(name: "Image2"),
        .image(name: "Image3")
    ]

    var totalAmount: Int {
        tickets.reduce(0) { $0 + ($1.price * $1.quantity) }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {

                // MARK: - Hero Image
                EventMediaCarousel(mediaItems: mediaItems)


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
                    // MARK: - Select Tickets
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Select Tickets")
                            .font(.headline)
                        ForEach($tickets) { $ticket in
                            TicketSelectionCard(ticket: $ticket)
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
                title: totalAmount > 0 ? "Pay ₹\(totalAmount)" : "Select Ticket",
                backgroundColor: totalAmount > 0 ? .brightOrange : .gray,
                titleColor: .white
            ) {
                guard totalAmount > 0 else { return }
                if authManager.isLoggedIn {
                    showPayment = true
                } else {
                    showLogin = true
                }
            }
            .disabled(totalAmount == 0)
            .sheet(isPresented: $showLogin) {
                LoginSignUPScreen(isPresented: $showLogin) {
                    authManager.isLoggedIn = true
                    showLogin = false
                    showPayment = true
                }
                .presentationDetents([.medium])
                .presentationBackground(.white)
                .presentationDragIndicator(.hidden)
            }
            .sheet(isPresented: $showPayment) {
                PaymentScreenView(amount: totalAmount, event: event)
            }
            .padding(.horizontal)
            .padding(.top, 8)
            .padding(.bottom, 16) // 👈 safe-area feel
        }
        .background(.ultraThinMaterial)
    }

}
