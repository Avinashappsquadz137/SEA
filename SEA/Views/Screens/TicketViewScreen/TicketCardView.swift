//
//  TicketCardView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 24/01/26.
//
import SwiftUI

struct TicketCardView: View {
    let ticket: TicketModel

    var body: some View {
        HStack(spacing: 12) {
            Image(ticket.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 6) {
                Text(ticket.eventName)
                    .font(.headline)

                Label(ticket.date, systemImage: "calendar")
                    .font(.caption)
                    .foregroundColor(.secondary)

                Label(ticket.location, systemImage: "location")
                    .font(.caption)
                    .foregroundColor(.secondary)

                HStack {
                    Text(ticket.bookingId)
                        .font(.caption2)
                        .padding(6)
                        .background(Color.purple.opacity(0.1))
                        .clipShape(Capsule())

                    Text("Confirmed")
                        .font(.caption2)
                        .foregroundColor(.green)
                }
            }

            Spacer()

            Image(systemName: "qrcode")
                .font(.title2)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05), radius: 6)
    }
}
