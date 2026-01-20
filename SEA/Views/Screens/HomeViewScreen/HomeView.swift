//
//  HomeView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 17/01/26.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        VStack(spacing: 20) {
            Text("Home Screen")
                .font(.largeTitle)

            Button("Show Toast") {
                ToastManager.shared.show(
                    message: "Something went wrong"
                )
            }
        }
        .overlay(ToastView())   
    }
}


#Preview {
    HomeView()
}
