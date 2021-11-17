//
//  ConfirmationView+Strings.swift
//  NinjaUI
//
//  Created by Luis Luna on 11/16/21.
//

import SwiftUI

extension ConfirmationView {
    
    /// Localized strings in this view
    enum Strings: LocalizedStringKey {
        
        /// Hello, ``User/name```!
        case titleLabel = "confirmation_title_label"
        
        /// Your super-awesome portfolio has been successfully submitted!
        /// The details below will be public within your community!
        case subtitleLabel = "confirmation_message_label"
        
        /// Sign In
        case signinButton = "confirmation_signin_button"
    }
}
