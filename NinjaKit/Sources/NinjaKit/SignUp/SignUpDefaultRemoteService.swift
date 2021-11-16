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
        let endpoint = SignupEndpoint()
        
        // TODO: Here we should handle all the boiler plate
        // in a RequestBuilder or extensions, in order to consider query params,
        // endpoint path, methods, timeout, etc...
        var request = URLRequest(url: url) // We are ignoring the endpoint path (Excersise purposes)
        request.httpMethod = endpoint.method.value
        
        return perform(request: request)
            .mapError { SignUpRemoteServiceError.remote($0)}
            .map { _ in data } // Here we are injecting the given data like a real server response
            .eraseToAnyPublisher()
    }
}


extension SignUpDefaultRemoteService {
    
    /// Endpoint that registers a new user
    struct SignupEndpoint: Endpoint {
        var path: String {
            "/some/path/to/register/endpoint"
        }
        
        var method: HTTPMethod {
            .post
        }
    }
}
