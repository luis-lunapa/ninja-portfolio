//
//  SignUpFormView.swift
//  NinjaUI
//
//  Created by Luis Luna on 11/16/21.
//

import SwiftUI

/// Vertical stacked text fields for the main form
struct SignUpFormView: View {
    
    @Binding var name: String
    
    @Binding var email: String
    
    @Binding var password: String
    
    @Binding var website: String
    
    var body: some View {
        VStack {
            TextField(Strings.nameField.rawValue,
                      text: $name)
            
            TextField(Strings.emailField.rawValue,
                      text: $email)
            
            TextField(Strings.passwordField.rawValue,
                      text: $password)
            
            TextField(Strings.websiteField.rawValue,
                      text: $website)
            
        }
        .textFieldStyle(SmoothGrayRoundedTextFieldStyle())
    }
}



extension SignUpFormView {
    
    enum Strings: LocalizedStringKey {
        case nameField = "signup_name_field"
        case emailField = "signup_email_field"
        case passwordField = "signup_password_field"
        case websiteField = "signup_website_field"
    }
}

struct SignUpFormView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFormView(name: .constant(""),
                       email: .constant(""),
                       password: .constant(""),
                       website: .constant(""))
    }
}
