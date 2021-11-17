//
//  ConfirmationView.swift
//  NinjaUI
//
//  Created by Luis Luna on 11/16/21.
//

import NinjaKit
import SwiftUI

/// View that displays the signup confirmation
struct ConfirmationView: View {
    
    var user: User
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(Strings.titleLabel.inject(user.name ?? Strings.defaultName.localized))
                    .bold()
                    .font(.largeTitle)
                    .padding(.bottom)
                
                Text(Strings.subtitleLabel.localized)
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
                
                
            }
            
            Button {
                // Some secret action 👀
            } label: {
                Text(Strings.signinButton.localized)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 15))
            .controlSize(.large)
            .tint(Color.buttonColor)
            .padding(.bottom)
            
        }
        .padding()
        .navigationBarHidden(true)
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
