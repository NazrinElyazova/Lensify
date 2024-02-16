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
    //    let lastName: String
}
//FireBase
struct UserInfo: Codable {
    let email: String?
    let password: String?
    let fullname: String?
}

// Facebook
// MARK: - Facebook
struct FacebookLogin {
    let email: String
//    let password: String
    let firstName: String
    let lastName: String
    
}
//struct FacebookLogin: Codable {
//    let code: Int?
//    let body: Body?
//}
//
//// MARK: - Body
//struct Body: Codable {
//    let error: Error?
//}
//
//// MARK: - Error
//struct Error: Codable {
//    let message, type: String?
//    let code: Int?
//}

