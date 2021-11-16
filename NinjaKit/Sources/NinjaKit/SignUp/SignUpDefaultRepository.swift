//
//  SignUpDefaultRepository.swift
//  
//
//  Created by Luis Luna on 11/15/21.
//

import Combine
import Foundation

/// Default production implementation of ``SignUpRepositoryProtocol``
class SignUpDefaultRepository: SignUpRepositoryProtocol {
    
    var remote: SignUpRemoteService
    
    init(remote: SignUpRemoteService = SignUpDefaultRemoteService()) {
        self.remote = remote
    }
    
    func register<U>(user: U) -> AnyPublisher<User, SignUpRepositoryError> where U : User, U : Encodable {
        Just(user)
            .encode(encoder: JSONEncoder())
            .mapError { SignUpRepositoryError.encode($0) }
            .flatMap { [self] encodedUser in
                remote
                    .register(user: encodedUser)
                    .mapError { SignUpRepositoryError.remote($0) }
            }
            .decode(type: NinjaUser.self, decoder: JSONDecoder())
            .mapError { SignUpRepositoryError.decode($0) }
            .map { $0 as User }
            .eraseToAnyPublisher()
    }
}
