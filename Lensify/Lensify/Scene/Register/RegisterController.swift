//
//  RegisterController.swift
//  Lensify
//
//  Created by Nazrin on 31.01.24.
//

import UIKit
import GoogleSignIn
import FirebaseAuth

class RegisterController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var fullnameTextField: UITextField!
    
    var completion: ((String, String)-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
    }
    @IBAction func registerAction(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { [weak self]
                result, error in
                if let error = error {
                    print(error.localizedDescription)
                } else if let user = result?.user {
                    //                    print(user)
                    self?.completion?(user.email ?? "", password)
                    self?.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
}
