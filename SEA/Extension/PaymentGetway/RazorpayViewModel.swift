//
//  RazorpayViewModel.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 06/02/26.
//

import Foundation
import Razorpay
import Combine

protocol RazorpayViewModelDelegate: AnyObject {
    func paymentDidSucceed(paymentId: String)
    func paymentDidFail(code: Int32, message: String)
}

final class RazorpayViewModel: NSObject, ObservableObject {

    private var razorpay: RazorpayCheckout?
    weak var delegate: RazorpayViewModelDelegate?

    init(key: String) {
        super.init()
        razorpay = RazorpayCheckout.initWithKey(key, andDelegate: self)
    }

    func openPayment(
        from viewController: UIViewController,
        orderId: String,
        amount: String,
        currency: String,
        name: String,
        contact: String,
        email: String
    ) {
        let options: [String: Any] = [
            "order_id": orderId,
            "amount": amount,
            "currency": currency,
            "description":"Hello World",
            "image": UIImage(named:"AppIcon") ?? "" ,
            "name": name,
            "prefill": [
                "contact": contact,
                "email": email
            ],
            "theme": [
                "color": "#FFA500"
            ]
        ]

        razorpay?.open(options, displayController: viewController)
    }
}
extension RazorpayViewModel: RazorpayPaymentCompletionProtocolWithData {

    func onPaymentSuccess(_ payment_id: String, andData response: [AnyHashable : Any]?) {
        delegate?.paymentDidSucceed(paymentId: payment_id)
    }

    func onPaymentError(_ code: Int32,
                        description str: String,
                        andData response: [AnyHashable : Any]?) {
        delegate?.paymentDidFail(code: code, message: str)
    }
}

