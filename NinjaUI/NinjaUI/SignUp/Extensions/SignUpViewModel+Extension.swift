//
//  SignUpViewModel+Extension.swift
//  NinjaUI
//
//  Created by Luis Luna on 11/16/21.
//

import NinjaKit
import SwiftUI

extension SignUpViewModel.FormFields {
    
    var localizedKey: LocalizedStringKey {
        switch self {
        case .email:
            return SignUpView.Strings.emailError.rawValue
        case .password:
            return SignUpView.Strings.passwordError.rawValue
        case .website:
            return SignUpView.Strings.websiteError.rawValue
        }
    }
}

extension SignUpViewModel.VMError: Identifiable {
    public var id: String {
        "\(self)"
    }
}
