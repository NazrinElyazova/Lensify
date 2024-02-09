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
        
        func saveUserInfoFirebase(data: UserInfo) {
            
            let database = Firestore.firestore()
            let info: [String: Any] = [
                "email": data.email as Any,
                "password": data.password as Any,
                "fullname": data.fullname as Any
            ]
            
            database.collection("UserInfo").addDocument(data: info) {
                error in
                if let error = error {
                    print("User infonu firebase save edende error bas verdi: \(error.localizedDescription)")
                } else {
                    print("User info ugurla elave olundu")
                }
            }
        }
    }

