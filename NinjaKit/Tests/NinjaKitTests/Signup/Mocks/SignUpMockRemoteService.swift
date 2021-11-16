//
//  SignUpMockRemoteService.swift
//  
//
//  Created by Luis Luna on 11/16/21.
//

import Combine
import Foundation
@testable import NinjaKit

/// Mock remote service implementation for tests
struct SignUpMockRemoteService: SignUpRemoteService {
    
    var session: NetworkSession = MockNetworkSession()
    private var _failure: Bool
    
    init(failure: Bool = false) {
        self._failure = failure
    }
    
    func register(user data: Data) -> AnyPublisher<Data, SignUpRemoteServiceError> {
        let result: Result<Data, SignUpRemoteServiceError> = _failure
        ? .failure(.remote(.status(500)))
        : .success(data)
        
        return result.publisher.eraseToAnyPublisher()
    }
}
