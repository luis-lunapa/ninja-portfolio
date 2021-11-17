//
//  SignUpFormView.swift
//  NinjaUI
//
//  Created by Luis Luna on 11/16/21.
//

import SwiftUI

/// Vertical stacked text fields for the main form
struct SignUpFormView: View {
    
    /// Determines wheter the password is visible in the UI
    @State var showPassword: Bool = false
    
    @Binding var name: String
    
    @Binding var email: String
    
    @Binding var password: String
    
    @Binding var website: String
    
    var body: some View {
        VStack(spacing: 20) {
            TextField(Strings.nameField.rawValue,
                      text: $name)
                .keyboardType(.namePhonePad)
            
            TextField(Strings.emailField.rawValue,
                      text: $email)
                .keyboardType(.emailAddress)
            
            passwordField
            
            TextField(Strings.websiteField.rawValue,
                      text: $website)
                .keyboardType(.URL)
            
        }
        .textFieldStyle(SmoothGrayRoundedTextFieldStyle())
    }
    
    /// Field to input the password
    var passwordField: some View {
        VStack {
            HStack {
                if showPassword {
                    TextField(Strings.passwordField.rawValue,
                              text: $password)
                } else {
                    SecureField(text: $password) {
                        Text(Strings.passwordField.rawValue)
                    }
                }
                
                if !password.isEmpty {
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: "eye")
                            .tint(.primary)
                    }
                }
                
            }

        }
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
