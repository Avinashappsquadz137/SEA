//
//  ToastManager.swift
//  InventoryAppUI
//
//  Created by Sanskar IOS Dev on 04/01/25.
//

import SwiftUI
import Combine

final class ToastManager: ObservableObject {

    static let shared = ToastManager()

    @Published var showToast = false
    @Published var toastMessage = ""

    private init() {}

    func show(message: String) {
        toastMessage = message
        withAnimation {
            showToast = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                self.showToast = false
            }
        }
    }
}


struct ToastView: View {

    @ObservedObject var toastManager = ToastManager.shared

    var body: some View {
        VStack {
            if toastManager.showToast {
                HStack(spacing: 8) {
                    Image("SEAicon")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .clipShape(Circle())

                    Text(toastManager.toastMessage)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.black.opacity(0.85))
                .cornerRadius(12)
                .transition(.move(edge: .top).combined(with: .opacity))
            }
            Spacer()
        }
        .padding(.top, 20)
        .animation(.easeInOut, value: toastManager.showToast)
    }
}


struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Button("Show Toast") {
                    ToastManager.shared.show(message: "This is a Toast message!")
                }
                .navigationBarTitle("Navigation Bar", displayMode: .inline)
                Spacer()
            }
            .overlay(ToastView())
        }
    }
}


struct ToastViewBack: View {
    var message: String
    @Binding var isShowing: Bool
    
    var body: some View {
        Group {
            if isShowing {
                Text(message)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(10)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                isShowing = false
                            }
                        }
                    }
            }
        }
        .animation(.easeInOut, value: isShowing)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.top, 20)
    }
}
