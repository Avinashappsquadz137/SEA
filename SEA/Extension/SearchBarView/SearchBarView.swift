//
//  SearchBarView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 21/01/26.
//


import SwiftUI

struct SearchBarView: View {

    @Binding var text: String
    let onFilterTap: () -> Void

    var body: some View {
        HStack(spacing: 12) {

            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)

                TextField("Search events, artists, location", text: $text)
                    .font(.subheadline)
            }
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(14)

            Button(action: onFilterTap) {
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.purple)
                    .cornerRadius(14)
            }
        }
        .padding(.horizontal)
    }
}
