//
//  DatabaseAdapter.swift
//  Lensify
//
//  Created by Nazrin on 31.01.24.
//

import Foundation
import KeychainSwift
import FirebaseAuth
import FirebaseFirestore

class DatabaseAdapter {
    var keychain = KeychainSwift()
    func saveUserInfo(data: UserData) {
        
        //file manager
        //keychain
        //core data
        //user defaults
        
        UserDefaults.standard.setValue(data.firstName, forKey: "firstName")
        
        keychain.set(data.email, forKey: "email")
        keychain.set(data.password, forKey: "password")
    }
}

