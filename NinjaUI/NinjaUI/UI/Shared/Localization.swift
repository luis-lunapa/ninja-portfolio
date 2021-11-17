//
//  Localization.swift
//  NinjaUI
//
//  Created by Luis Luna on 11/16/21.
//

import Foundation

/// Protocol that all locale definition list should conform to
/// to easily manage localization inside a `View`
protocol LocaleList: RawRepresentable where RawValue == LocaleString {
    
    /// The localized value for the key
    var localized: String { get }
    
    /// Inject the given values in the order they are found
    /// - Parameter values: The values to inject in the localization
    /// - Returns: Localized final version
    func inject(_ values: String...) -> String
}

extension LocaleList {
    var localized: String {
        rawValue.value
    }
    
    func inject(_ values: String...) -> String {
        values.enumerated()
            .reduce(into: localized) { string, value in
            string = string.replacingOccurrences(of: "%\(value.offset)@",
                                                 with: value.element)
        }
    }
}

/// Simple implementation for handling localizations
/// For the exercise it does not support customization
struct LocaleString: Equatable, ExpressibleByStringLiteral {
   
    /// The key to use in the strings table
    var key: String
    
    /// The localized value for the current key
    var value: String {
        NSLocalizedString(key, comment: "")
    }
    
    init(stringLiteral value: String) {
        self.key = value
    }
}
