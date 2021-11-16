//
//  SignUpRepositoryProtocol.swift
//  
//
//  Created by Luis Luna on 11/15/21.
//

import Combine
import Foundation

/// Contains all the available repository operations
/// and services calls beloging to the *Sign up* use case
protocol SignUpRepositoryProtocol {
    
    /// The remote service dependency for this repository
    var remote: SignUpRemoteService { get }
    
    /// Peforms a register user operation with the given validated instance
    /// - Parameter user: The user already validated
    /// - Returns: Publisher with registered user or error
    ///
    /// I made this method generic in order to decouple the implementation of the ``User`` protocol to the definition
    /// of this protocol, also by receiving the type at this level I can assure the containing information was previously validated
    /// when creating that instance
    func register<U: User>(user: U) -> AnyPublisher<User, SignUpRepositoryError> where U : Encodable
}

/// Errors produced by the ``SignUpRepositoryProtocol``
enum SignUpRepositoryError: Error {
    
    /// Error encoding data
    case decode(Error)
    
    /// Error decoding data
    case encode(Error)
    
    /// Error during remote operation
    case remote(SignUpRemoteServiceError)
}
