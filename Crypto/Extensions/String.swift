//
//  String.swift
//  Crypto
//
//  Created by Soufiane Benkhaldoun on 18/01/2022.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
