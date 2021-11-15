//
//  User.swift
//  
//
//  Created by Luis Luna on 11/15/21.
//

import Foundation

/// Represents an user with the basic information needed to create
/// a profile with the corresponding portfolio
public protocol User {
    
    /// The first name of the user if any
    var name: String? { get }
    
    /// The email used as an username and id
    var email: String { get }
    
    /// The secured user password to log into the service
    var password: String { get }
    
    /// `URL` of this user portfolio if any
    var website: URL? { get }
}
