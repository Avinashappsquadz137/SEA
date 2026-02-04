//
//  TicketDetailCardView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 24/01/26.
//
import SwiftUI

struct TicketFlipCardView: View {
    
    let ticket: TicketModel
    @State private var isFlipped = false
    
    let cardHeight: CGFloat = 500
    let cardRatio: CGFloat = 85.60 / 53.98

    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                if isFlipped {
                    backSide
                } else {
                    frontSide
                }
            }
            .frame(
                width: cardHeight / cardRatio,
                height: cardHeight
            )
            .rotation3DEffect(
                .degrees(isFlipped ? 180 : 0),
                axis: (x: 0, y: 1, z: 0),
                perspective: 0.7
            )
            .animation(.easeInOut(duration: 0.6), value: isFlipped)
            .onTapGesture {
                isFlipped.toggle()
            }
            PrimaryButton(
                title: "SHOW QR CODE",
                backgroundColor: .purple,
                titleColor: .white
            ) {
                isFlipped = true
            }
            HStack(spacing: 12) {
                PrimaryButton(
                    title: "DOWNLOAD",
                    backgroundColor: .gray,
                    titleColor: .white
                ) {
                    print("DOWNLOAD")
                }
                PrimaryButton(
                    title: "SHARE",
                    backgroundColor: .gray,
                    titleColor: .white
                ) {
                    print("SHARE")
                }
            }
        }
        .padding()
        .toolbar(.hidden, for: .tabBar)
    }
}


extension TicketFlipCardView {
    
    var frontSide: some View {
        ZStack {
            VStack(spacing: 16) {
                HStack(alignment: .top) {

                    VStack(alignment: .leading, spacing: 4) {
                        Text("EVENT")
                            .font(.caption2)
                            .opacity(0.8)

                        Text(ticket.eventName)
                            .font(.title3)
                            .fontWeight(.bold)
                            .lineLimit(2)
                    }

                    Spacer()

                    Image(ticket.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(.white.opacity(0.8), lineWidth: 1)
                        )
                }

                Divider().background(.white.opacity(0.7))

                // Middle Info
                HStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 6) {
                        Label(ticket.date, systemImage: "calendar")
                        Label(ticket.location, systemImage: "location.fill")
                    }
                    .font(.caption)

                    Spacer()

                    VStack(alignment: .trailing, spacing: 6) {
                        Text("AMOUNT")
                            .font(.caption2)
                            .opacity(0.8)

                        Text(ticket.amount)
                            .font(.headline)
                    }
                }

                Spacer()

                // Bottom Row
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("BOOKING ID")
                            .font(.caption2)
                            .opacity(0.8)

                        Text(ticket.bookingId)
                            .font(.caption)
                            .fontWeight(.bold)
                    }

                    Spacer()
                    Image(systemName: "arrow.trianglehead.clockwise.rotate.90")
                    
                }
            }
            .padding(20)
            .foregroundColor(.white)

            // 🔥 CENTER PROFILE IMAGE
            Image(ticket.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(.white, lineWidth: 3)
                )
                .shadow(radius: 8)
        }
        .background(
            LinearGradient(
                colors: [.purple, .pink],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }



}
extension TicketFlipCardView {
    
    var backSide: some View {
        VStack(spacing: 20) {

            HStack {
                Text("ENTRY PASS")
                    .font(.caption)
                    .opacity(0.8)

                Spacer()

                Image(systemName: "qrcode.viewfinder")
            }

            Spacer()

            Image(systemName: "qrcode")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160)

            Text(ticket.bookingId)
                .font(.caption2)
            Text("2026")

            Spacer()
        }
        .padding(20)
        .foregroundColor(.white)
        .background(
            LinearGradient(
                colors: [.pink, .purple],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
    }

}
