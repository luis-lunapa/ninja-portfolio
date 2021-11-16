//
//  SignUpView.swift
//  NinjaUI
//
//  Created by Luis Luna on 11/16/21.
//

import NinjaKit
import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            formHeading
                .padding(.vertical, 25)
            
            formContent
            
            Spacer()
            
            formFooter
        }
        .padding(.horizontal)
        .alert(item: $viewModel.error) { error in
            makeAlert(for: error)
        }
    }
    
    var formHeading: some View {
        VStack(alignment: .leading) {
            Text(Strings.titleLabel.rawValue)
                .bold()
                .font(.largeTitle)
                .padding(.bottom)
            
            Group {
                Text(Strings.subtitle1Label.rawValue)
                Text(Strings.subtitle2Label.rawValue)
            }
            .font(.headline)
        }
    }
    
    var formContent: some View {
        SignUpFormView(name: $viewModel.name,
                       email: $viewModel.email,
                       password: $viewModel.password,
                       website: $viewModel.website)
    }
    
    var formFooter: some View {
        HStack {
            Spacer()
            Button(Strings.submitButton.rawValue) {
                viewModel.registerUser()
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 15))
            .controlSize(.large)
            .tint(Color(#colorLiteral(red: 1, green: 0.253264904, blue: 0.1271932125, alpha: 1)))
            
            Spacer()
        }
        .padding(.bottom)
    }
    
    /// Creates an alert to display the given error to the user
    // This method is a little naive, the complete solution would be
    // to display some kind of UI so the user knows which fields are missing
    // instead of looking for them manually
    func makeAlert(for error: SignUpViewModel.VMError) -> Alert {
        
        let title: Text
        var message: Text?
        
        switch error {
        case let .missingFields(fields):
            title = Text(Strings.formErrorTitle.rawValue)
            message = fields
                .reduce(Text("")) { text, field in
                    text + Text(field.localizedKey) + Text("\n")
                }
            
        case .registration:
            title = Text(Strings.registrationErrorTitle.rawValue)
        }
        
        return Alert(title: title,
                     message: message,
                     dismissButton: nil)
    }
}

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

extension SignUpView {
    
    enum Strings: LocalizedStringKey {
        case titleLabel = "signup_title_label"
        case subtitle1Label = "signup_subtitle1_label"
        case subtitle2Label = "signup_subtitle2_label"
        case submitButton = "signup_submit_button"
        
        case formErrorTitle = "signup_error_alert_title_form"
        case registrationErrorTitle = "signup_error_alert_title_register"
        case emailError = "signup_error_missing-email"
        case passwordError = "signup_error_missing-password"
        case websiteError = "signup_error_missing-website"
    }
}

extension SignUpViewModel.VMError: Identifiable {
    public var id: String {
        "\(self)"
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel())
    }
}
