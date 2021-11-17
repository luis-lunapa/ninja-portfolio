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
    @State var showConfirmation: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            
            formHeading
                .padding(.vertical, 25)
            
            formContent
            
            Spacer()
            
            formFooter
            
            if let user = viewModel.user {
                NavigationLink(destination: ConfirmationView(user: user),
                               isActive: $showConfirmation) {
                    EmptyView()
                }
                .onAppear {
                    showConfirmation = true
                }
            }
        }
        .padding(.horizontal)
        .navigationBarHidden(true)
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
            .tint(Color.buttonColor)
            
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel())
    }
}
