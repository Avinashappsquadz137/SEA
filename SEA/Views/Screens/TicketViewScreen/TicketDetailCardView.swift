//
//  TicketDetailCardView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 24/01/26.
//
import SwiftUI

struct TicketDetailCardView: View {
    let ticket: TicketModel

    var body: some View {
        VStack (spacing: 16){
            
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Event Ticket")
                    .font(.caption)
                    .opacity(0.8)
                HStack {
                    Text(ticket.eventName)
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "ticket")
                }
                
                Label(ticket.date, systemImage: "calendar")
                Label(ticket.location, systemImage: "location")
                
                Divider().background(Color.white.opacity(1))
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Booking ID")
                            .font(.caption)
                        Text(ticket.bookingId)
                            .font(.headline)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("Amount Paid")
                            .font(.caption)
                        Text(ticket.amount)
                            .font(.headline)
                    }
                }
            }
            .padding()
            .foregroundColor(.white)
            .background(
                LinearGradient(
                    colors: [.purple, .pink],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            PrimaryButton(
                title: "SHOW QR CODE",
                backgroundColor: .purple,
                titleColor: .white,
              
            ) {
                print("SHOW QR CODE")
            }
            HStack {
                PrimaryButton(
                    title: "DOWNLOAD",
                    backgroundColor: .gray,
                    titleColor: .white,
                  
                ) {
                    print("DOWNLOAD")
                }
                PrimaryButton(
                    title: "SHARE",
                    backgroundColor: .gray,
                    titleColor: .white,
                  
                ) {
                    print("SHARE")
                }
            }
            
            
            
        }
    }
}
