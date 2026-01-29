//
//  ReadMoreText.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 24/01/26.
//


import SwiftUI

struct ReadMoreText: View {
    let text: String
    let lineLimit: Int

    @State private var isExpanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(text)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(isExpanded ? nil : lineLimit)
                .animation(.easeInOut, value: isExpanded)

            Button {
                isExpanded.toggle()
            } label: {
                Text(isExpanded ? "Read Less" : "Read More")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.brightOrange)
            }
        }
    }
}
