//
//  LocationSelectorView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 20/01/26.
//


import SwiftUI

struct LocationSelectorView: View {

    let locationName: String
    let onChangeTap: () -> Void

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "location.fill")
                .font(.caption)
                .foregroundColor(.orange)

            Text(locationName)
                .font(.caption)
                .foregroundColor(.gray)

            Button(action: onChangeTap) {
                Text("Change")
                    .font(.caption)
                    .foregroundColor(.blue)
            }
        }
    }
}
