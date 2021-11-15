//
//  RemoteService.swift
//  
//
//  Created by Luis Luna on 11/15/21.
//

import Combine
import Foundation

/// Protocol that all performing a request or connection with a *remote service* conform to
///
/// This type allows us to create a unique shared way of handing common errors, output and behaviours
/// Since this execise only requires one remote service it is not required
/// The protocol also allows us to declare a default implemetation in a extension, which could be use the
/// current `URLSession.Shared` or some mocking technique
protocol RemoteService {
    
    /// The session to use for all requests
    var session: NetworkSession { get }
    
    /// Performs the given network request, handles the common `URLError` and
    /// returns the output wrapped inside a customizable `Publisher`
    /// - Parameter request: The complete ``URLRequest`` to be executed
    /// - Returns: Erased published with the request result and error
    func perform(request: URLRequest) -> AnyPublisher<Data, RemoteError>
}

extension RemoteService {
    
    // Since in this exercise we are not making any actual request
    // the default implementation always returns a success condition
    func perform(request: URLRequest) -> AnyPublisher<Data, RemoteError> {
        session
            .loadData(from: request)
            .mapError { RemoteError.url($0)}
            .map(\.data)
            .eraseToAnyPublisher()
        // Here goes any other common handling
        // Eg. A retry when the session is expired 🤔
    }
}

/// Type that defines the possible errors returned by all *Remote services*
enum RemoteError: Error {
    
    /// Error from API enabled page found
    case url(URLError)
    
    /// Error with an unexpected *HTTP* status code
    case status(Int)
    
    // TODO: Add common errors
    // Remote service handles errors such as missing network, authentication errors,
    // unexpected http response coded, etc..
}
