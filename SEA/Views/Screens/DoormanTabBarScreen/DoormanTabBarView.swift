//
//  DoormanTabBarView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 10/02/26.
//

import SwiftUI

struct DoormanTabBarView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        TabView {
            NavigationStack {
                DoormanQRView()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Close") {
                                dismiss()
                            }
                        }
                    }
            }
            .tabItem {
                Label("Scan", systemImage: "qrcode.viewfinder")
            }
            NavigationStack {
                ManuallyQRView()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Close") {
                                dismiss()
                            }
                        }
                    }
            }
            .tabItem {
                Label("Validate", systemImage: "text.viewfinder")
            }
            NavigationStack {
                TicketListView()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Close") {
                                dismiss()
                            }
                        }
                    }
            }
            .tabItem {
                Label("Tickets", systemImage: "list.bullet")
            }
        }
    }
}

struct TicketListView: View {
    var body: some View {
        Text("Ticket List Screen")
            .navigationTitle("Tickets")
    }
}

