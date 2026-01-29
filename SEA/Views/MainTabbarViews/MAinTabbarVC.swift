//
//  MAinTabbarVC.swift
//  InventoryAppUI
//
//  Created by Sanskar IOS Dev on 12/12/24.
//

import SwiftUI

struct MainTabBarView: View {

    @State private var selectedTab = 0

    init() {
        configureTabBar()
    }

    var body: some View {
        TabView(selection: $selectedTab) {

            NavigationStack {
                HomeView()
                    //.navigationTitle("HOME")
            }
            .tabItem {
                Label("HOME", systemImage: "house.fill")
            }
            .tag(0)

            NavigationStack {
                ExploreView()
                    .navigationTitle("EXPLORE")
            }
            .tabItem {
                Label("EXPLORE", systemImage: "magnifyingglass")
            }
            .tag(1)

            NavigationStack {
                TicketView()
                    //.navigationTitle("TICKET")
            }
            .tabItem {
                Label("TICKET", systemImage: "ticket")
            }
            .tag(2)

            NavigationStack {
                ProfileView()
                    .navigationTitle("PROFILE")
            }
            .tabItem {
                Label("PROFILE", systemImage: "person")
            }
            .tag(3)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .tint(Color.brightOrange) // replaces accentColor
    }
}

// MARK: - TabBar Appearance
private func configureTabBar() {
    let appearance = UITabBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = UIColor(Color.brightOrange)

    let itemAppearance = UITabBarItemAppearance()
    itemAppearance.normal.iconColor = .black
    itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black]

    itemAppearance.selected.iconColor = UIColor(Color.brightOrange)
    itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color.brightOrange)]

    appearance.stackedLayoutAppearance = itemAppearance

    UITabBar.appearance().standardAppearance = appearance
    UITabBar.appearance().scrollEdgeAppearance = appearance
}

