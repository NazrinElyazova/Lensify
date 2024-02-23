//
//  StringExtension.swift
//  Lensify
//
//  Created by Nazrin on 23.02.24.
//

import Foundation
extension String {
    var localize: String {
        return NSLocalizedString(self, comment: "")
    }
}
