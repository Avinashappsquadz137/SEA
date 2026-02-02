//
//  LoginAuthViewModel.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 29/01/26.
//
import SwiftUI
import Combine

@MainActor
class LoginAuthViewModel: ObservableObject {

    enum Step {
        case phone
        case otp
    }

    @Published var phoneNumber: String = ""
    @Published var otp: String = ""
    @Published var step: Step = .phone
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var isLoggedIn: Bool = false
    
    func sendOTP() async {
        guard !phoneNumber.isEmpty else {
            errorMessage = "Please enter phone number"
            return
        }

        isLoading = true
        errorMessage = nil

        do {
            let response: SendOTPModels = try await ApiClient.shared.request(
                endpoint: Constant.sendOtp,
                method: .post,
                parameters: ["mobile": phoneNumber],
                isMultipart: false
            )

            if response.success == true {
                step = .otp   // ✅ move to OTP screen
            } else {
                errorMessage = response.message ?? "Something went wrong"
            }

        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }

    func verifyOTP() async {
            guard !otp.isEmpty else {
                errorMessage = "Please enter OTP"
                return
            }
            isLoading = true
            errorMessage = nil
            do {
                let response: VerifyOTPResponse = try await ApiClient.shared.request(
                    endpoint: Constant.verifyOtp,
                    method: .post,
                    parameters: [
                        "mobile": phoneNumber,
                        "otp": otp,
                        "deviceId": "fdhxdfbf",
                        "deviceName": "cvbxcv"
                    ],
                    isMultipart: false
                )

                if response.success == true {
                    // ✅ SAVE TOKENS IF NEEDED
                    // UserDefaults.standard.set(response.data?.accessToken, forKey: "token")

                    isLoggedIn = true
                } else {
                    errorMessage = response.message
                }

            } catch {
                errorMessage = error.localizedDescription
            }

            isLoading = false
        }
}
