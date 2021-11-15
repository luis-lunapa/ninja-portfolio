//
//  SignUpViewModel.swift
//  
//
//  Created by Luis Luna on 11/15/21.
//

import Combine
import Foundation

/// View model in charge of handling the logic to create a new user account
public class SignUpViewModel: ObservableObject {
    
    @Published var user: User?
}
