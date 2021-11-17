//
//  SmoothGrayRoundedTextFieldStyle.swift
//  NinjaUI
//
//  Created by Luis Luna on 11/16/21.
//

import SwiftUI

/// Style that adds a gray border with round corners
struct SmoothGrayRoundedTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(Color.gray, lineWidth: 2)
            )
    }
}
