//
//  SignUpView+Strings.swift
//  NinjaUI
//
//  Created by Luis Luna on 11/16/21.
//

import SwiftUI

extension SignUpView {
    
    /// Localized strings in this view
    /// I always provide the value for the default locale so its easy to see the value
    /// from the code
    enum Strings: LocalizedStringKey {
        
        /// Profile Creation
        case titleLabel = "signup_title_label"
        
        /// Use the form below to submit your portfolio.
        case subtitle1Label = "signup_subtitle1_label"
        
        /// An email and password are required.
        case subtitle2Label = "signup_subtitle2_label"
        
        /// Submit
        case submitButton = "signup_submit_button"
        
        /// Oops the form has some errors
        case formErrorTitle = "signup_error_alert_title_form"
        
        /// There was an issue registering you, please try again
        case registrationErrorTitle = "signup_error_alert_title_register"
        
        /// We need to know your email
        case emailError = "signup_error_missing-email"
        
        /// A password is required
        case passwordError = "signup_error_missing-password"
        
        /// The site provided does not seem right
        case websiteError = "signup_error_missing-website"
    }
}
