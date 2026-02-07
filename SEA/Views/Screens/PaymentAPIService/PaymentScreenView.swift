//
//  PaymentScreenView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 06/02/26.
//
import SwiftUI
import Razorpay
import Foundation

enum PaymentResult {
    case success(String)
    case failed(Int32, String)
    case cancelled
}

final class PaymentAPIService {

    static let shared = PaymentAPIService()
    private init() {}

    func paymentSuccess(
        userId: String,
        preTransactionId: String,
        postTransactionId: String,
        planId: String,
        completion: @escaping (Result<String, Error>) -> Void
    ) {

        let params: [String: Any] = [
            "user_id": userId,
            "pre_transaction_id": preTransactionId,
            "post_transaction_id": postTransactionId,
            "plan_id": planId
        ]
        print("🚀 Payment Success API Params:", params)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            completion(.success("Payment stored successfully"))
        }
    }
}

final class PaymentDelegate: NSObject, RazorpayViewModelDelegate {

    var onResult: ((PaymentResult) -> Void)?

    func paymentDidSucceed(paymentId: String) {
        onResult?(.success(paymentId))
    }

    func paymentDidFail(code: Int32, message: String) {
        onResult?(.cancelled)
    }
}

struct PaymentScreenView: View {

    let amount: Int
    let event: EventModel
    @Environment(\.dismiss) private var dismiss
    @State private var showRazorpay = false
    private let paymentDelegate = PaymentDelegate()
    @StateObject private var razorpayVM =
        RazorpayViewModel(key: "rzp_test_wlwMtEPTnFcCm2")

    
    var body: some View {
        VStack(spacing: 20) {

            Text(event.title)
            Text("₹\(amount)")
                .font(.largeTitle)

            Button("Pay Now") {
                showRazorpay = true
            }
        }
        .onAppear {
            razorpayVM.delegate = paymentDelegate
            paymentDelegate.onResult = { _ in
                showRazorpay = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    dismiss()
                }
            }
        }
        .fullScreenCover(isPresented: $showRazorpay) {
            RazorpayPresenter(
                isPresented: $showRazorpay,
                viewModel: razorpayVM,
                orderId: "",
                amount: "\(amount)00",
                currency: "INR",
                name: "Avinash",
                contact: "9753449013",
                email: "avinash@example.com"
            )
        }
    }
}


struct RazorpayPresenter: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    let viewModel: RazorpayViewModel
    let orderId: String
    let amount: String
    let currency: String
    let name: String
    let contact: String
    let email: String

    func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIViewController()
        DispatchQueue.main.async {
            viewModel.openPayment(
                from: vc,
                orderId: orderId,
                amount: amount,
                currency: currency,
                name: name,
                contact: contact,
                email: email
            )
        }
        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
