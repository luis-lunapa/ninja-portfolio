//
//  Endpoint.swift
//  
//
//  Created by Luis Luna on 11/15/21.
//

import Foundation

/// Defines the properties required to perform a network request
///
/// - Important:
/// This type is only used for demostration purposes of the complete architecure
protocol Endpoint {
    
    /// The complete`URI` path
    var path: String { get }
    
    /// The method to use when performing a request
    var method: HTTPMethod { get }
    
    /// Determines whether the  resource required authentication
    var authRequired: Bool { get }
}

/// The supported *HTTP Verbs* for all ``Endpoint``
///
/// This type removed the need to deal directly with ``String`` types
/// when using a ``URLRequest`` and the foundation networking APIs
///
/// For the purpose of the exercise only contains two cases: (GET, POST)
enum HTTPMethod: String {
    
    /// The *GET* http verb
    case `get` = "GET"
    
    /// The *POST* http verb
    case post = "POST"
}
