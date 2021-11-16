//
//  NinjaUser.swift
//  
//
//  Created by Luis Luna on 11/15/21.
//

import Foundation

/// Default implementation of ``User`` protocol
/// that can be decoded and encoded
struct NinjaUser: User {
    var name: String?
    
    var email: String
    
    var password: String
    
    var website: URL?

}

// I will leave the default codable synthetization
extension NinjaUser: Codable {}
