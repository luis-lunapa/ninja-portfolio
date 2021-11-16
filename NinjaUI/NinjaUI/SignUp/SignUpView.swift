//
//  SignUpView.swift
//  NinjaUI
//
//  Created by Luis Luna on 11/16/21.
//

import NinjaKit
import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack {
            
            formHeading
            
            formContent
            
            Spacer()
            
            formFooter
        }
    }
    
    var formHeading: some View {
        VStack {
            Text(Strings.titleLabel.rawValue)
            
            Text("Use the form below to submit your portfolio. An Email and password is required")
        }
    }
    
    var formContent: some View {
        VStack {
            TextField(Strings.nameField.rawValue,
                      text: .constant(""))
            
            TextField(Strings.emailField.rawValue,
                      text: .constant(""))
            
            TextField(Strings.passwordField.rawValue,
                      text: .constant(""))
            
            TextField(Strings.websiteField.rawValue,
                      text: .constant(""))
            
        }
    }
    
    var formFooter: some View {
        Button(Strings.submitButton.rawValue) {
            // TODO: Call register
        }
    }
}

extension SignUpView {
    
    enum Strings: LocalizedStringKey {
        case titleLabel = "signup_title_label"
        case subtitle1Label = "signup_subtitle1_label"
        case subtitle2Label = "signup_subtitle2_label"
        case nameField = "signup_name_field"
        case emailField = "signup_email_field"
        case passwordField = "signup_password_field"
        case websiteField = "signup_website_field"
        case submitButton = "signup_submit_button"
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
