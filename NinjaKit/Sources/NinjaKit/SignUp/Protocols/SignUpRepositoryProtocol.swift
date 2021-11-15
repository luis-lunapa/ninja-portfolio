//
//  SignUpRepositoryProtocol.swift
//  
//
//  Created by Luis Luna on 11/15/21.
//

import Foundation

/// Contains all the available repository operations
/// and services calls beloging to the *Sign up* use case
protocol SignUpRepositoryProtocol {
    
    /// The remote service dependency for this repository
    var remote: SignUpRemoteService { get }
    
    #warning("TODO: Add methods that use the available services")
}
