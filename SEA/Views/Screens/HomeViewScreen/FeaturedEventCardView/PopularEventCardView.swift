//
//  PopularEventCardView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 24/01/26.
//
import SwiftUI

struct PopularEventCardView: View {
    let event: EventModel
    var onWishlistTap: () -> Void

    var body: some View {
        HStack(spacing: 12) {

            // Event Image
            ZStack(alignment: .topTrailing) {
                Image(event.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                
                Button(action: onWishlistTap) {
                    Image(systemName: "heart")
                        .foregroundColor(.black)
                        .padding(6)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 2)
                }
                .padding(6)
            }

            // Event Info
            VStack(alignment: .leading, spacing: 6) {

                Text(event.date)
                    .font(.caption)
                    .foregroundColor(.purple)
                    .fontWeight(.semibold)

                Text(event.title)
                    .font(.headline)
                    .lineLimit(1)

                HStack(spacing: 4) {
                    Image(systemName: "location.fill")
                        .font(.caption2)
                        .foregroundColor(.gray)

                    Text(event.location)
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                Text(event.price)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
            }

            Spacer()

            // Attendees
            VStack {
                Image(systemName: "person.2.fill")
                    .foregroundColor(.gray)
                Text(event.attendees)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
        .padding(.horizontal)
    }
}
