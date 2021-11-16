//
//  SignUpDefaultRemoteServiceTests.swift
//  
//
//  Created by Luis Luna on 11/15/21.
//

import XCTest
import Combine
@testable import NinjaKit

final class SignUpDefaultRemoteServiceTests: NinjaKitTests {
    
    var subcriptions = Set<AnyCancellable>()
    
    /// This is an example of a test, in a real one we migh try with different payloads
    /// and assert the error or success corresponds to what we sent
    func testRegisterUser_Success() throws {
        let session = MockNetworkSession()
        
        let service = SignUpDefaultRemoteService(session: session)
        
        let expect = expectation(description: #function)
        
        service
            .register(user: Data())
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
        let session = MockNetworkSession(error: URLError.badURL)
        
        let service = SignUpDefaultRemoteService(session: session)
        
        let expect = expectation(description: #function)
        
        service
            .register(user: Data())
            .sink { completion in
                if case .failure = completion {
                    expect.fulfill()
                }
            } receiveValue: { _ in
                XCTFail("Unexpected failure")
            }
            .store(in: &subcriptions)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}
