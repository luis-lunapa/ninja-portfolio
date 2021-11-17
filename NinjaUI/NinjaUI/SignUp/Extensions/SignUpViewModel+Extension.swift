//
//  SignUpViewModel+Extension.swift
//  NinjaUI
//
//  Created by Luis Luna on 11/16/21.
//

import NinjaKit
import SwiftUI

extension SignUpViewModel.FormFields {
    
    var localizedKey: String {
        switch self {
        case .email:
            return SignUpView.Strings.emailError.localized
        case .password:
            return SignUpView.Strings.passwordError.localized
        case .website:
            return SignUpView.Strings.websiteError.localized
        }
    }
}

extension SignUpViewModel.VMError: Identifiable {
    public var id: String {
        "\(self)"
    }
}
