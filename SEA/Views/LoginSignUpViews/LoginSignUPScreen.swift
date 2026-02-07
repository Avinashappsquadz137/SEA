//
//  LoginSignUPScreen.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 29/01/26.
//

import SwiftUI

struct LoginSignUPScreen: View {
    @Binding var isPresented: Bool
    @StateObject private var viewModel = LoginAuthViewModel()
    var onLoginSuccess: () -> Void
    
    var body: some View {
        BottomSheetView {
            if viewModel.step == .phone {
                PhoneInputView(viewModel: viewModel)
            } else {
                OTPInputView(viewModel: viewModel)
            }
        }
        .presentationDetents([.medium])
        .onChange(of: viewModel.isLoggedIn) { loggedIn in
            if loggedIn {
                isPresented = false   // ✅ AUTO DISMISS
                onLoginSuccess() 
            }
        }
    }
}


struct BottomSheetView<Content: View>: View {

    let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack {
            Capsule()
                .frame(width: 40, height: 5)
                .foregroundColor(.gray.opacity(0.5))
                .padding(.top, 8)
            content
                .padding()
        }
        .background(
            Color.white
        )
        .cornerRadius(20)
        .ignoresSafeArea(edges: .bottom)
    }
}

