//
//  EventMediaCarousel.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 02/02/26.
//

import AVKit
import SwiftUI

enum EventMedia: Identifiable {
    case image(name: String)
    case video(url: URL)

    var id: UUID { UUID() }
}

struct EventMediaCarousel: View {

    let mediaItems: [EventMedia]
    @State private var currentIndex = 0

    var body: some View {
        ZStack(alignment: .topTrailing) {

            TabView(selection: $currentIndex) {
                ForEach(Array(mediaItems.enumerated()), id: \.offset) { index, item in
                    mediaView(for: item)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(maxWidth: .infinity)
            .aspectRatio(16/9, contentMode: .fit)

            // Overlay Icons
            HStack(spacing: 12) {
                iconButton(systemName: "square.and.arrow.up")
                iconButton(systemName: "heart")
            }
            .padding()

            // Page Dots
            VStack {
                Spacer()
                PageIndicator(
                    total: mediaItems.count,
                    current: currentIndex
                )
                .padding(.bottom, 12)
            }
        }
    }

    @ViewBuilder
    private func mediaView(for item: EventMedia) -> some View {
        switch item {
        case .image(let name):
            Image(name)
                .resizable()
                .scaledToFill()
                .clipped()

        case .video(let url):
            VideoPlayer(player: AVPlayer(url: url))
                .scaledToFill()
        }
    }
    func iconButton(systemName: String) -> some View {
        Button {
            print("\(systemName) tapped")
        } label: {
            Image(systemName: systemName)
                .foregroundColor(.black)
                .padding(10)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(radius: 3)
        }
    }
}
struct PageIndicator: View {

    let total: Int
    let current: Int

    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<total, id: \.self) { index in
                Capsule()
                    .fill(index == current ? Color.white : Color.white.opacity(0.4))
                    .frame(width: index == current ? 18 : 6, height: 6)
            }
        }
        .animation(.easeInOut, value: current)
    }
}
