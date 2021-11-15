//
//  SignUpDefaultRemoteService.swift
//  
//
//  Created by Luis Luna on 11/15/21.
//

import Combine
import Foundation

/// Current default production implementation of the `SignUpRemoteService`
class SignUpDefaultRemoteService: SignUpRemoteService {
    
    var session: NetworkSession
    
    /// Create a service that uses the given session
    ///
    /// We can use dependency injection to use our custom sessions
    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }
    
    func register(user data: Data) -> AnyPublisher<Data, SignUpRemoteServiceError> {
        fatalError("Missing implementation")
    }
}
