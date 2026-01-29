//
//  MovieView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 17/01/26.
//

import SwiftUI
struct TicketModel: Identifiable {
    let id = UUID()
    let eventName: String
    let date: String
    let location: String
    let bookingId: String
    let amount: String
    let status: TicketStatus
    let imageName: String
}

enum TicketStatus {
    case upcoming
    case past
}
struct TicketSegmentedControl: View {
    @Binding var selectedIndex: Int
    let titles: [String]
    
    var body: some View {
        HStack {
            ForEach(titles.indices, id: \.self) { index in
                Button {
                    selectedIndex = index
                } label: {
                    Text(titles[index])
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(
                            selectedIndex == index
                            ? Color.white
                            : Color.clear
                        )
                        .foregroundColor(
                            selectedIndex == index
                            ? .brightOrange
                            : .secondary
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .padding(6)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}


struct EmptyTicketView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .center ,spacing: 12) {
            Image(systemName: "ticket")
                .font(.largeTitle)
                .foregroundColor(.gray)
            
            Text(title)
                .font(.headline)
            
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.top, 80)
    }
}

struct TicketView: View {
    @State private var selectedTab = 0
    
    let tickets: [TicketModel] = [
        TicketModel(
            eventName: "Sunburn Festival 2026",
            date: "Jan 25–27",
            location: "Goa, India",
            bookingId: "TKT4F8G9H2K5",
            amount: "₹2999",
            status: .upcoming,
            imageName: "SEAicon"
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TicketSegmentedControl(
                selectedIndex: $selectedTab,
                titles: ["Upcoming", "Past"]
            )
            ScrollView {
                if selectedTab == 0 {
                    ForEach(tickets) { ticket in
                        NavigationLink {
                            TicketDetailCardView(ticket: ticket)
                                .padding()
                        } label: {
                            TicketCardView(ticket: ticket)
                        }
                        .buttonStyle(.plain)
                    }
                } else {
                    VStack {
                        Spacer()
                        if tickets.count == 0 {
                            EmptyTicketView(
                                title: "No tickets found",
                                subtitle: "You don't have any past events"
                            )
                        }else {
                            ForEach(tickets) { ticket in
                                NavigationLink {
                                    TicketDetailCardView(ticket: ticket)
                                        .padding()
                                } label: {
                                    TicketCardView(ticket: ticket)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}
