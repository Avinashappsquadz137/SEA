//
//  TicketSelectionCard.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 02/02/26.
//
import SwiftUI

struct TicketSelectionCard: View {

    @Binding var ticket: TicketType

    var isSelected: Bool {
        ticket.quantity > 0
    }

    var body: some View {
        VStack(spacing: 14) {

            // MARK: - Top Section
            HStack(alignment: .top) {

                VStack(alignment: .leading, spacing: 6) {

                    HStack(spacing: 8) {
                        Text(ticket.name.uppercased())
                            .font(.caption)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Color.brightOrange.opacity(0.15))
                            .foregroundColor(.brightOrange)
                            .clipShape(RoundedRectangle(cornerRadius: 999))

                        Spacer()
                    }

                    Text("₹\(ticket.price)")
                        .font(.title3)
                        .fontWeight(.bold)

                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(ticket.perks, id: \.self) { perk in
                            HStack(spacing: 6) {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.caption2)
                                    .foregroundColor(.green)

                                Text(perk)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }

                Spacer()

                // MARK: - Quantity Stepper
                VStack(spacing: 8) {

                    Button {
                        if ticket.quantity > 0 {
                            withAnimation(.easeInOut) {
                                ticket.quantity -= 1
                            }
                        }
                    } label: {
                        Image(systemName: "minus")
                            .font(.footnote)
                            .frame(width: 30, height: 30)
                            .background(Color(.systemGray5))
                            .clipShape(Circle())
                    }
                    .disabled(ticket.quantity == 0)

                    Text("\(ticket.quantity)")
                        .font(.headline)
                        .frame(minWidth: 24)

                    Button {
                        withAnimation(.easeInOut) {
                            ticket.quantity += 1
                        }
                    } label: {
                        Image(systemName: "plus")
                            .font(.footnote)
                            .frame(width: 30, height: 30)
                            .background(Color.brightOrange)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(.systemBackground))
                .shadow(
                    color: isSelected
                        ? Color.brightOrange.opacity(0.25)
                        : Color.black.opacity(0.08),
                    radius: isSelected ? 10 : 6,
                    x: 0,
                    y: 4
                )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(
                    isSelected
                        ? Color.brightOrange
                        : Color.clear,
                    lineWidth: 1.5
                )
        )
        .animation(.easeInOut, value: ticket.quantity)
    }
}

