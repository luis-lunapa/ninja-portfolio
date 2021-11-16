//
//  SignUpMockRepository.swift
//  
//
//  Created by Luis Luna on 11/16/21.
//

import Combine
import Foundation
@testable import NinjaKit

struct SignUpMockRepository: SignUpRepositoryProtocol {
    var remote: SignUpRemoteService = SignUpMockRemoteService()
    private var _failure: Bool
    
    init(failure: Bool = false) {
        _failure = failure
    }
    
    func register<U>(user: U) -> AnyPublisher<User, SignUpRepositoryError> where U : User, U : Encodable {
        // We can customize the mocking behaviour as much as we want
        // But I'm leaving it to a constant error and success combinations
        
        let result: Result<User, SignUpRepositoryError> = _failure
        ? .failure(.remote(.remote(.status(404))))
        : .success(MockUser())
        
        return result.publisher.eraseToAnyPublisher()
    }
    
    
}
