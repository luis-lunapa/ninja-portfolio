//
//  SignUpDefaultRemoteService.swift
//  
//
//  Created by Luis Luna on 11/15/21.
//

import Combine
import Foundation

/// Current default production implementation of the `SignUpRemoteService`
struct SignUpDefaultRemoteService: SignUpRemoteService {
    
    func register(user data: Data) -> AnyPublisher<Data, SignUpRemoteServiceError> {
        fatalError("Missing implementation")
    }
}
