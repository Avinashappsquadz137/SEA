//
//  PhoneInputView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 29/01/26.
//
import SwiftUI

struct PhoneInputView: View {

    @ObservedObject var viewModel: LoginAuthViewModel

    var body: some View {
        VStack(spacing: 20) {

            Image("SEAicon")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            Text("Login / Sign Up")
                .font(.title2)
                .bold()

            TextField("Enter phone number", text: $viewModel.phoneNumber)
                .keyboardType(.phonePad)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)

            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
            }

            PrimaryButton(
                title: viewModel.isLoading ? "Sending..." : "Send OTP",
                backgroundColor: Color.brightOrange,
                titleColor: .white
            ) {
                Task {
                    await viewModel.sendOTP()
                }
            }
            .disabled(viewModel.isLoading)
        }
    }
}
