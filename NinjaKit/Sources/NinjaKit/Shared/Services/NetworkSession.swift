//
//  NetworkSession.swift
//  
//
//  Created by Luis Luna on 11/15/21.
//

import Combine
import Foundation

/// The session that actually performs some network request
///
/// This type allows us to create mock sessions for testing
protocol NetworkSession {
    
    /// Creates a `URLSession.DataTaskPublisher` wrapped inside an
    /// `AnyPublisher`
    func loadData(from request: URLRequest) -> AnyPublisher<URLSession.DataTaskPublisher.Output, URLSession.DataTaskPublisher.Failure>
}

/// The  default `URLSession` must implement this protocol in order to be used from our ``RemoteService``
extension URLSession: NetworkSession {
    
    func loadData(from request: URLRequest) -> AnyPublisher<DataTaskPublisher.Output, DataTaskPublisher.Failure> {
        dataTaskPublisher(for: request).eraseToAnyPublisher()
    }
}
