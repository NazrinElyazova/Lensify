//
//  User.swift
//  Lensify
//
//  Created by Nazrin on 31.01.24.
//

import Foundation

// Google
struct UserData: Codable {
    let email: String
    let password: String
    let firstName: String
}
//FireBase
struct UserInfo: Codable {
    let email: String?
    let password: String?
}
