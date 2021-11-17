//
//  ConfirmationView.swift
//  NinjaUI
//
//  Created by Luis Luna on 11/16/21.
//

import NinjaKit
import SwiftUI

struct ConfirmationView: View {
    
    var user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Strings.titleLabel.rawValue)
                .bold()
                .font(.largeTitle)
                .padding(.bottom)
            
            Text(Strings.subtitleLabel.rawValue)
                .font(.headline)
                .padding(.bottom)
            
            HStack {
                Spacer()
                VStack(spacing: 15) {
                    if let url = user.website {
                        Link(url.absoluteString, destination: url)
                    }
                    
                    if let name = user.name {
                        Text(name)
                    }
                    
                    Text(user.email)
                }
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Button(Strings.signinButton.rawValue) {
                    // Some final action
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 15))
                .controlSize(.large)
                .tint(Color.buttonColor)
                
                Spacer()
            }
            .padding(.bottom)
            
        }
        .padding()
        .navigationBarHidden(true)
    }
}

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

struct ConfirmationView_Previews: PreviewProvider {
    
    struct PreviewUser: User {
        var name: String? = "John Test"
        
        var email: String = "test@email.com"
        
        var password: String = "12345"
        
        var website: URL? = URL(string: "https://microsoft.com")
        
    }
    static var previews: some View {
        ConfirmationView(user: PreviewUser())
    }
}
