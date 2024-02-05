//
//  DatabaseAdapter.swift
//  Lensify
//
//  Created by Nazrin on 31.01.24.
//

import Foundation
import KeychainSwift

class DatabaseAdapter {
    var keychain = KeychainSwift()
        func saveUserInfo(data: UserData) {
            
            //file manager
            //keychain
            //core data
            //user defaults
            
            UserDefaults.standard.setValue(data.firstName, forKey: "firstName")
            UserDefaults.standard.setValue(data.lastName, forKey: "lastName")

            keychain.set(data.email, forKey: "email")
            keychain.set(data.password, forKey: "password")

        }
}
