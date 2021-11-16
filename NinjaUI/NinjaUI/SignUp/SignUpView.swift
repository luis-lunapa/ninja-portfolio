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
            TextField(Strings.titleLabel.rawValue,
                      text: .constant(""), prompt: nil)
            
        }
    }
}

extension SignUpView {
    
    enum Strings: LocalizedStringKey {
        case titleLabel = "signup_title_label"
        case subtitleLabel
        case nameField = "fvd"
        case emailField
        case passwordField
        case websiteField
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
