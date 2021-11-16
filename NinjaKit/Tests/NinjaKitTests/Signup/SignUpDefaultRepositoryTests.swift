//
//  SignUpDefaultRepositoryTests.swift
//  
//
//  Created by Luis Luna on 11/15/21.
//

import XCTest
import Combine
@testable import NinjaKit

final class SignUpDefaultRepositoryTests: NinjaKitTests {
    
    var subcriptions = Set<AnyCancellable>()
    
    func testRegisterUser_Success() throws {
        
        let remote = SignUpMockRemoteService()
        
        let repository = SignUpDefaultRepository(remote: remote)
        
        let expect = expectation(description: #function)
        
        let user = NinjaUser(name: "John",
                             email: "john@email.com",
                             password: "rfew442",
                             website: nil)
        
        repository
            .register(user: user)
            .sink { completion in
                if case let .failure(error) = completion {
                    XCTFail(String(describing: error))
                }
            } receiveValue: { _ in
                expect.fulfill()
            }
            .store(in: &subcriptions)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testRegisterUser_Failure() throws {
        
        let remote = SignUpMockRemoteService(failure: true)
        
        let repository = SignUpDefaultRepository(remote: remote)
        
        let expect = expectation(description: #function)
        
        let user = NinjaUser(name: "John",
                             email: "john@email.com",
                             password: "rfew442",
                             website: nil)
        
        repository
            .register(user: user)
            .sink { completion in
                if case .failure = completion {
                    expect.fulfill()
                    
                }
            } receiveValue: { _ in
                XCTFail("Unexpected success")
            }
            .store(in: &subcriptions)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}

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
