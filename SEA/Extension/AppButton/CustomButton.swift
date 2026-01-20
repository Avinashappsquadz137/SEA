//
//  CustomButton.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 17/01/26.
//

import SwiftUI

struct PrimaryButton: View {

    let title: String
    var backgroundColor: Color = .blue
    var titleColor: Color = .white
    var isDisabled: Bool = false
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(isDisabled ? Color.gray : backgroundColor)
                .foregroundColor(titleColor)
                .cornerRadius(12)
        }
        .disabled(isDisabled)
    }
}
//PrimaryButton(
//    title: "Skip",
//    backgroundColor: .gray,
//    titleColor: .black,
//    width: 120
//) {
//    print("Skipped")
//}

