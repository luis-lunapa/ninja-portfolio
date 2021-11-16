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
    
    // MARK: - State
    
    /// The created user after calling the ``register``
    @Published internal(set) public var user: User?
    
    @Published internal(set) public var error: VMError?
    
    // Signup form
    @Published var name: String = ""
    
    @Published var email: String = ""
    
    @Published var password: String = ""
    
    @Published var website: String = ""
    
    // MARK: - Internal Properties
    var subcriptions = Set<AnyCancellable>()
    
    // MARK: - Dependencies
    var repository: SignUpRepositoryProtocol
    
    init(repository: SignUpRepositoryProtocol = SignUpDefaultRepository()) {
        self.repository = repository
    }
    
    // MARK: - Public Interface
    
    /// Starts the registration process using the form data
    public func registerUser() {
        // TODO: Implement Calls
    }
    
    // MARK: - Internal Methods
    func validateData() -> User? {
        // We should validate the email address using a regex or data detector
        // For now I'm only gonna validate the password and email fields are not empty
        var missingRequiredFields: [FormFields] = []
        var websiteURL: URL?
        
        if email.isEmpty {
            missingRequiredFields.append(.email)
        }
        
        if password.isEmpty {
            missingRequiredFields.append(.password)
        }
        
        // Only check for a valid url if some is provided
        if !website.isEmpty {
            if let url = URL(string: website) {
                websiteURL = url
            } else {
                missingRequiredFields.append(.website)
            }
        }
        
        // If there are any errors fail the simple validation
        guard missingRequiredFields.isEmpty else {
            error = .missingFields(missingRequiredFields)
            return nil
        }
        
        return NinjaUser(name: name.isEmpty ? nil : name,
                         email: email,
                         password: password,
                         website: websiteURL)
    }
}

public extension SignUpViewModel {
    
    enum FormFields {
        case email
        case password
        case website
    }
    
    enum VMError: Error {
        case missingFields([FormFields])
        case registration
    }
}

//protocol SignUpViewModelProtocol: ObservableObject {
//
//}
