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
    }
    
    func login(type: LoginType) {
        switch type {
        case .google:
            googleLogin()
        case .facebook:
            facebookLogin()
        }
    }
    
    fileprivate func googleLogin() {
        GIDSignIn.sharedInstance.signIn(withPresenting: controller) { result, error in
            if let error = error {
                print(error)
            }
            else if let result = result {
                let user = UserData(email: result.user.profile?.email ?? "",
                                    password: "",
                                    firstName: result.user.profile?.name ?? "")
                self.completion?(user)
            }
        }
    }
    
    fileprivate  func facebookLogin() {
        if let token = AccessToken.current,
           !token.isExpired {
            GraphRequest(graphPath: "me", parameters: ["fields": "id,email,first_name,last_name"]).start { (connection, result, error) in
                if let error = error {
                    print("Facebook Graph API Error var: \(error.localizedDescription)")
                } else if let result = result as? [String: Any] {
                    let email = result["email"] as? String ?? ""
                    let firstName = result["first_name"] as? String ?? ""
                    let lastName = result["last_name"] as? String ?? ""
                }
            }
        }
    }
}
