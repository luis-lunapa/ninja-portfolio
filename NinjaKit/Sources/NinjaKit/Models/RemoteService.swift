//
//  RemoteService.swift
//  
//
//  Created by Luis Luna on 11/15/21.
//

import Combine
import Foundation

/// Protocol that all performing a request or connection with a *remote service* conform to
protocol RemoteService {
    
    /// Performs the given network request, handles the common `URLError` and
    /// returns the output wrapped inside a customizable `Publisher`
    /// - Parameter request: The complete ``URLRequest`` to be executed
    /// - Returns: Erased published with the request result and error
    func perform(request: URLRequest) -> AnyPublisher<Data, RemoteServiceError>
}

/// Type that defines the possible errors returned by all *Remote services*
protocol RemoteServiceError: Error {
    
    /// Error from API enabled page found
    func url(_ error: URLError)
    
    /// Error with an unexpected *HTTP* status code
    func status(_ code: Int)
    
    // TODO: Add common errors
    // Remote service handles errors such as missing network, authentication errors,
    // unexpected http response coded, etc..
}
