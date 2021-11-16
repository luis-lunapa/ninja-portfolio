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
                       website: $viewModel.password)
    }
    
    var formFooter: some View {
        HStack {
            Spacer()
            Button(Strings.submitButton.rawValue) {
                // TODO: Call register
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 15))
            .controlSize(.large)
            .tint(Color(#colorLiteral(red: 1, green: 0.253264904, blue: 0.1271932125, alpha: 1)))
            
            Spacer()
        }
    }
}

extension SignUpView {
    
    enum Strings: LocalizedStringKey {
        case titleLabel = "signup_title_label"
        case subtitle1Label = "signup_subtitle1_label"
        case subtitle2Label = "signup_subtitle2_label"
        case submitButton = "signup_submit_button"
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel())
    }
}
