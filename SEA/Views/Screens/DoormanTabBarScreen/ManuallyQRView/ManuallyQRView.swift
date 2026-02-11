//
//  ManuallyQRView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 10/02/26.
//
import SwiftUI

struct ManuallyQRView: View {

    @State private var code: String = ""
    @State private var showConfirmSheet = false
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                ManuallyCardView()

                Text("Have a code? Enter it below")
                    .font(.headline)
                    .foregroundColor(.primary)

                TextField("Enter Code", text: $code)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)

                PrimaryButton(
                    title: "Validate",
                    backgroundColor: .purple,
                    titleColor: .white
                ) {
                    print("Entered Code:", code)
                    showConfirmSheet = true
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding(.top)
        }
        .sheet(isPresented: $showConfirmSheet) {
            SheetConfirmView()
                .presentationDetents([.medium])
        }
    }
}



struct SheetConfirmView: View {

    let totalTickets: Int = 20   // QR se aaya hua data
    @State private var usedTickets: Int = 20

    var remainingTickets: Int {
        totalTickets - usedTickets
    }

    var body: some View {
        VStack(spacing: 24) {
            ScrollView{
                // Drag Indicator
                Capsule()
                    .fill(Color.gray.opacity(0.4))
                    .frame(width: 40, height: 5)
                    .padding(.top, 8)
                
                // Title
                Text("Confirm Tickets")
                    .font(.title2)
                    .bold()
                
                // Ticket Summary Card
                VStack(spacing: 12) {
                    
                    HStack {
                        Text("Total Tickets")
                        Spacer()
                        Text("\(totalTickets)")
                            .bold()
                    }
                    
                    HStack {
                        Text("Using Now")
                        Spacer()
                        Text("\(usedTickets)")
                            .bold()
                            .foregroundColor(.green)
                    }
                    
                    HStack {
                        Text("Remaining")
                        Spacer()
                        Text("\(remainingTickets)")
                            .bold()
                            .foregroundColor(.orange)
                    }
                    
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(16)
                
                // Ticket Selector
                VStack(spacing: 12) {
                    
                    Text("Select tickets to use")
                        .font(.headline)
                    
                    HStack(spacing: 30) {
                        
                        Button {
                            if usedTickets > 1 {
                                usedTickets -= 1
                            }
                        } label: {
                            Image(systemName: "minus.circle.fill")
                                .font(.system(size: 32))
                                .foregroundColor(.red)
                        }
                        
                        Text("\(usedTickets)")
                            .font(.largeTitle)
                            .bold()
                        
                        Button {
                            if usedTickets < totalTickets {
                                usedTickets += 1
                            }
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 32))
                                .foregroundColor(.green)
                        }
                    }
                }
                
                Spacer()
                // Confirm Button
                PrimaryButton(
                    title: "Confirm Entry",
                    backgroundColor: .purple,
                    titleColor: .white
                ) {
                    print("Used \(usedTickets), Remaining \(remainingTickets)")
                    
                }
                .padding(.horizontal)
            }
        }
        .padding()
        .presentationDetents([.medium])
    }
}


struct ManuallyCardView: View {

    var body: some View {
        ZStack(alignment: .bottomLeading) {

            // Background Image (Asset Image)
            Image("Image3")
                .resizable()
                .aspectRatio(4/4, contentMode: .fill)
                .frame(maxWidth: .infinity)
                .clipped()

            // Gradient Overlay
            LinearGradient(
                colors: [.clear, .black.opacity(0.8)],
                startPoint: .top,
                endPoint: .bottom
            )

            // Content
            VStack(alignment: .leading, spacing: 6) {
                Text("Sanskar Holi Rang")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("Entertainment Event")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.9))

                Text("Friday, 06 Feb 2026")
                    .font(.caption2)
                    .foregroundColor(.white.opacity(0.8))

                Text("Venue: Sanskar Holi Rang")
                    .font(.caption2)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding()
        }
        .cornerRadius(24)
        .padding(.horizontal)
        .shadow(radius: 6)
    }
}
