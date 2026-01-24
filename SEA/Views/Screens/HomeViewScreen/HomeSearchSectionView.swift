//
//  HomeSearchSectionView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 21/01/26.
//


import SwiftUI

struct HomeSearchSectionView: View {

    @State private var searchText = ""
    @State private var selectedCategory = "Music"

    let categories = ["Music", "Comedy", "Tech", "Sports", "Art","Test","WorkShop" ,"Festivels"]

    var body: some View {
        VStack(spacing: 16) {

            SearchBarView(
                text: $searchText,
                onFilterTap: {
                    print("Filter tapped")
                }
            )

            CategoryListView(
                categories: categories,
                selectedCategory: $selectedCategory
            )
        }
        .padding(.vertical)
        .background(Color.white)
    }
}
