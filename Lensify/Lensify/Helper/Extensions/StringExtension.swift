//
//  StringExtension.swift
//  Lensify
//
//  Created by Nazrin on 23.02.24.
//

import Foundation

extension String {
    var localize: String {
        let language = UserDefaults.standard.string(forKey: "localizedLanguage")
        let path = Bundle.main.path(forResource: language, ofType: "lproj")
        
        guard let bundle = Bundle(path: path ?? "") else {return ""}
        return NSLocalizedString(self, bundle: bundle, comment: "")
    }
}
