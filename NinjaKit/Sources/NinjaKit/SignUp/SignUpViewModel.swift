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
    
    /// There was an error while performing some operation
    @Published public var error: VMError?
    
    /// There is an operation on course
    @Published public var loading: Bool = false
    
    // Signup form
    @Published public var name: String = ""
    
    @Published public var email: String = ""
    
    @Published public var password: String = ""
    
    @Published public var website: String = ""
    
    // MARK: - Internal Properties
    var subcriptions = Set<AnyCancellable>()
    
    // MARK: - Dependencies
    var repository: SignUpRepositoryProtocol
    
    // Since we are missing factories I'm declaring the init as public to the client
    // is able to instantiate it directly
    
    /// Creates a view model with the current production configuration
    public convenience init() {
        self.init(repository: SignUpDefaultRepository())
    }
    
    /// Internal initializer that allows DI
    init(repository: SignUpRepositoryProtocol) {
        self.repository = repository
    }
    
    // MARK: - Public Interface
    
    /// Starts the registration process using the form data
    public func registerUser() {
        guard let registrableUser = validateData() else {
            // Here I can use some logger call to register the event
            return
        }
        loading = true
        repository
            .register(user: registrableUser)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case .failure = completion {
                    // Here I am ignoring the specific repository test
                    self?.error = .registration
                }
                self?.loading = false
            } receiveValue: { [weak self] createdUser in
                self?.user = createdUser
            }
            .store(in: &subcriptions)
    }
    
    // MARK: - Internal Methods
    func validateData() -> NinjaUser? {
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
            // This check is naive since it only guarantees there are not any
            // non URL characters. For a real implementation we can use a DataDetector
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
