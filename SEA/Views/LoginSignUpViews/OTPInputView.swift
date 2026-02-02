//
//  OTPInputView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 29/01/26.
//
import SwiftUI

struct OTPInputView: View {

    @ObservedObject var viewModel: LoginAuthViewModel

    var body: some View {
        VStack(spacing: 20) {
            Image("SEAicon")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Text("Enter OTP")
                .font(.title2)
                .bold()

            TextField("OTP", text: $viewModel.otp)
                .keyboardType(.numberPad)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            PrimaryButton(
                title: "Verify & Login",
                backgroundColor: Color.brightOrange,
                titleColor: .white,
            ) {
                Task {
                    await viewModel.verifyOTP()
                }
            }

        }
    }
}
