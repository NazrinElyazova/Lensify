//
//  LoginAdapter.swift
//  Lensify
//
//  Created by Nazrin on 31.01.24.
//

import Foundation
import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit

class LoginAdapter {
    
    let manager = LoginManager()
    
    var success: (() -> Void)?
    var completion: ((UserData)->())?
    var controller: UIViewController  //Strong variable olmasi ucun init edirik. Controllerde set etmek yaddan cixsa app crash etmesin
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    enum LoginType {
        case google
        case facebook
        case apple
    }
    
    func login(type: LoginType) {
        switch type {
        case .google:
            googleLogin()
        case .facebook:
            facebookLogin()
        case .apple:
            appleLogin()
        }
    }
    
    fileprivate func googleLogin() {
        GIDSignIn.sharedInstance.signIn(withPresenting: controller) { result, error in
            if let error = error {
                print(error)
            }
            else if let result = result {
                let user = UserData(email: result.user.profile?.email ?? "", password: "Nezrin123", firstName: result.user.profile?.name ?? "", lastName: result.user.profile?.familyName ?? "")
                self.completion?(user)
            }
        }
    }
    
    fileprivate  func facebookLogin() {
        
        if let token = AccessToken.current, !token.isExpired {
            let token = token.tokenString
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "email, name"], tokenString: token, version: nil, httpMethod: .get)
            
            request.start(completion: { connection, result, error in
                print("Facebook Graph uğurlu oldu: \(String(describing: result))")
                
            })
        } else {
            
        }
//        let graphRequest = GraphRequest(graphPath: "me", parameters: ["fields": "email, name"])
//         graphRequest.start { connection, result, error in
//             if let error = error {
//                 print("Facebook Graph API error: \(error.localizedDescription)")
//             } else if let result = result as? [String: Any] {
//                 // Parse the Facebook user data
//                 let email = result["email"] as? String ?? ""
//                 let name = result["name"] as? String ?? ""
//                 
//                 let user = UserData(email: email, password: "Nezrin123", firstName: name, lastName: "")
//                 self.completion?(user)
//             }
//         }
    }
    fileprivate  func appleLogin() {
        
    }
}
