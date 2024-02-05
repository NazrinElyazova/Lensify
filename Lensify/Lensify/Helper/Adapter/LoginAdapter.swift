//
//  LoginAdapter.swift
//  Lensify
//
//  Created by Nazrin on 31.01.24.
//

import Foundation
import GoogleSignIn

class LoginAdapter {
    
    
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
                let user = UserData(email: result.user.profile?.email ?? "", password: "", firstName: result.user.profile?.name ?? "", lastName: result.user.profile?.familyName ?? "")
                
                self.completion?(user)
            
               
            }
        }
    }
  fileprivate  func facebookLogin() {
        
    }
  fileprivate  func appleLogin() {
        
    }
}
