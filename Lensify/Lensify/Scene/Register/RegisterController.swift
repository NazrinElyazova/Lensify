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
    
    var adapter: LoginAdapter?
    let databaseAdapter = DatabaseAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register Now !"
        adapterSave()
    }
    
    @IBAction func loginActionButton(_ sender: Any) {
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
    func adapterSave() {
        adapter = LoginAdapter(controller: self)
        adapter?.completion = {
            user in
            self.databaseAdapter.saveUserInfo(data: user)
            print(user)
        }
    }
}
