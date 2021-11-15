//
//  MockNetworkSession.swift
//  
//
//  Created by Luis Luna on 11/15/21.
//

import Foundation
import Combine
@testable import NinjaKit

/// Mock customizable session that returns failures or success as required
struct MockNetworkSession: NetworkSession {
    
    /// The data to return in the current session if any
    var data: Data?
    
    /// Error to be returned if any
    ///
    /// When set the data is ignored
    var error: URLError?
    
    /// Creates a fake network session
    /// - Parameters:
    ///   - data: The data to be returned by the load request if any
    ///   - code: The `URLError.Code` to be returned
    ///
    ///   If both parameters are empty the session will respond with a
    ///   success condition
    init(data: Data? = nil,
         error code: URLError.Code? = nil) {
        self.data = data
        
        if let errorCode = code {
            self.error = URLError.init(errorCode)
        }
    }
    
    func loadData(from request: URLRequest) -> AnyPublisher<URLSession.DataTaskPublisher.Output, URLSession.DataTaskPublisher.Failure> {
        
        let result: Result<URLSession.DataTaskPublisher.Output, URLError>
        
        if let error = error {
            result = .failure(error)
        } else {
            result = .success((data: data ?? Data(),
                               response: HTTPURLResponse()))
        }
        
        return result.publisher.eraseToAnyPublisher()
    }
}
