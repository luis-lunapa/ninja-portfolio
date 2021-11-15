//
//  SignUpRemoteService.swift
//  
//
//  Created by Luis Luna on 11/15/21.
//

import Combine
import Foundation

/// Service that contains the availble remote operations regarding
/// signing up use case
protocol SignUpRemoteService: RemoteService {
    
    /// Registers the given user data payload in the server
    /// - Parameter data: The encoded user data payload to send to the server
    /// - Returns: Erased publisher with the server response to be decoded later
    func register(user data: Data) -> AnyPublisher<Data, SignUpRemoteServiceError>
}

/// Type that defines the possible errors produced inside this service
///
/// In this exercise we are only considering the original ``RemoteError``
/// Also these service errors may conform to some protocol that forces them all to
///  include that case like:
///  ```
/// protocol RemoteServiceError {
///     static func remote(_ error: RemoteError)
/// }
///  ```
enum SignUpRemoteServiceError: Error {
    case remote(RemoteError)
    
    // Other errors only thrown in this service
}
