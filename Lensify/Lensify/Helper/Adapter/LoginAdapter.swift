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
    
    var fireBaseCompletion: ((UserInfo)-> ())?
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
        //        let signInConfig = GIDConfiguration.init(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(withPresenting: controller) { result, error in
            if let error = error {
                print(error)
            }
            else if let result = result {
                let user = UserData(email: result.user.profile?.email ?? "",
                                    password: "Nezrin123",
                                    firstName: result.user.profile?.name ?? "")
                //                                    lastName: result.user.profile?.familyName ?? "")
                self.completion?(user)
            }
        }
    }
    
    fileprivate  func facebookLogin() {
        
        if let token = AccessToken.current,
           !token.isExpired {
            // User qeydiyyatdan kecdi, do work such as go to next view controller.
        }
    }
}
