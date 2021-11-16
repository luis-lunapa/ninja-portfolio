//
//  MockUser.swift
//  
//
//  Created by Luis Luna on 11/16/21.
//

import Foundation
import NinjaKit

struct MockUser: User {
    
    var name: String?
    
    var email: String
    
    var password: String
    
    var website: URL?
    
    init(name: String? = nil,
         email: String = "test@email.com",
         password: String = "33dd",
         website: URL? = nil) {
        self.name = name
        self.email = email
        self.password = password
        self.website = website
    }
}
