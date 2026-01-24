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
    var borderColor: Color? = nil
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(isDisabled ? Color.gray : backgroundColor)
                .foregroundColor(titleColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(borderColor ?? .clear, lineWidth: 1)
                )
                .cornerRadius(12)
        }
        .disabled(isDisabled)
    }
}


