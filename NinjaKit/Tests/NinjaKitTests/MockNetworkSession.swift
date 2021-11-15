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
