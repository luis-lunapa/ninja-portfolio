//
//  SignUpViewModelTests.swift
//  
//
//  Created by Luis Luna on 11/16/21.
//

import XCTest
import Combine
@testable import NinjaKit

final class SignUpViewModelTests: NinjaKitTests {
    
    var viewModel: SignUpViewModel!
    var subscriptions = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = SignUpViewModel()
    }
    
    // MARK: - Register tests
    
    func testRegisterValidatedUser() throws {
        viewModel.repository = SignUpMockRepository()
        viewModel.name = "John Smith"
        viewModel.email = "test@email.com"
        viewModel.password = "pass1234"
        viewModel.website = "www.myweb.com"
        
        let expect = expectation(description: #function)
        
        viewModel
            .$user
            .sink { user in
                XCTAssertNotNil(user)
                expect.fulfill()
            }
            .store(in: &subscriptions)
        
        viewModel.registerUser()
        
        waitForExpectations(timeout: 2)
    }
    
    func testRegisterValidatedUserError() throws {
        viewModel.repository = SignUpMockRepository(failure: true)
        viewModel.name = "John Smith"
        viewModel.email = "test@email.com"
        viewModel.password = "pass1234"
        viewModel.website = "www.myweb.com"
        
        let expect = expectation(description: #function)
        
        viewModel
            .$error
            .drop { $0 == nil }
            .sink { error in
                if case SignUpViewModel.VMError.registration = error! {
                    expect.fulfill()
                }
            }
            .store(in: &subscriptions)
        
        viewModel.registerUser()
        
        waitForExpectations(timeout: 2)
    }
    
    // MARK: - Form validation tests
    
    func testValidateForm_MissingRequired() throws {
        viewModel.name = "John Smith"
        viewModel.email = ""
        viewModel.password = ""
        
        let validatedUser = viewModel.validateData()
        let error = try XCTUnwrap(viewModel.error)
        
        XCTAssertNil(validatedUser)
        
        if case let SignUpViewModel.VMError.missingFields(fieldErrors) = error {
            XCTAssertEqual(fieldErrors.count, 2)
        } else {
            XCTFail("Wrong error type received")
        }
    }
    
    func testValidateForm_InvalidWebsite() throws {
        viewModel.name = "John Smith"
        viewModel.email = "test@email.com"
        viewModel.password = "weqwdq"
        viewModel.website = "some random text"
        
        let validatedUser = viewModel.validateData()
        let error = try XCTUnwrap(viewModel.error)
        
        XCTAssertNil(validatedUser)
        
        if case let SignUpViewModel.VMError.missingFields(fieldErrors) = error {
            XCTAssertEqual(fieldErrors.count, 1)
            XCTAssertTrue(fieldErrors[0] == .website)
        } else {
            XCTFail("Wrong error type received")
        }
    }
    
    func testValidateForm_EmailPasswordOnly() throws {
        viewModel.email = "test@email.com"
        viewModel.password = "weqwdq"
        
        let validatedUser = viewModel.validateData()
        XCTAssertNotNil(validatedUser)
        XCTAssertNil(viewModel.error)
        XCTAssertEqual(validatedUser!.email, viewModel.email)
        XCTAssertEqual(validatedUser!.password, viewModel.password)
    }
    
    func testValidateForm_AllData() throws {
        viewModel.name = "John Smith"
        viewModel.email = "test@email.com"
        viewModel.password = "weqwdq"
        viewModel.website = "www.myweb.com"
        
        let validatedUser = viewModel.validateData()
        XCTAssertNotNil(validatedUser)
        XCTAssertNil(viewModel.error)
        XCTAssertEqual(validatedUser!.name, viewModel.name)
        XCTAssertEqual(validatedUser!.email, viewModel.email)
        XCTAssertEqual(validatedUser!.password, viewModel.password)
        XCTAssertEqual(validatedUser!.website!.absoluteString, viewModel.website)
    }
    
    func testValidateForm_AllDataEmptySite() throws {
        viewModel.name = "John Smith"
        viewModel.email = "test@email.com"
        viewModel.password = "weqwdq"
        
        let validatedUser = viewModel.validateData()
        XCTAssertNotNil(validatedUser)
        XCTAssertNil(viewModel.error)
        XCTAssertEqual(validatedUser!.name, viewModel.name)
        XCTAssertEqual(validatedUser!.email, viewModel.email)
        XCTAssertEqual(validatedUser!.password, viewModel.password)
        XCTAssertNil(validatedUser!.website)
    }
}
