//
//  RegisterController.swift
//  Lensify
//
//  Created by Nazrin on 31.01.24.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
import FBSDKLoginKit
import FirebaseFirestoreInternal

class RegisterController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var stackView: UIStackView!
    
    var completion: ((String, String)-> Void)?
    var adapter: LoginAdapter?
    
    let databaseAdapter = DatabaseAdapter()
    let facebookButton = FBLoginButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Register Now"
        adapterSave()
        faceButton()
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    @IBAction func googleButtonAction(_ sender: Any) {
        adapter?.login(type: .google)
        adapter?.completion = { user in
            self.emailTextField.text = user.email
            self.passwordTextField.text = user.password
        }
    }
    func faceButton() {
        stackView.axis = .vertical
        stackView.addArrangedSubview(facebookButton)
        
//        facebookButton.layer.cornerRadius = 20
        
        facebookButton.addTarget(self, action: #selector(facebookButonTapped), for: .touchUpInside)
        facebookButton.permissions = ["public_profile", "email"]
        facebookButton.layer.cornerRadius = 20.0
       facebookButton.layer.masksToBounds = true
    }
    
    @objc func facebookButonTapped() {
        adapter?.login(type: .facebook)
        //        if UserDefaults.standard.bool(forKey: "loggedIn") {
//        print(UserDefaults.standard.bool(forKey: "loggedIn"))
        //            adapter?.facebookCompletion = { user in
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "\(HomeController.self)") as! HomeController
        self.navigationController?.show(controller, sender: nil)
        login()
        
    }
    func login() {
        UserDefaults.standard.set(true, forKey: "loggedIn")
    }
    @IBAction func loginActionButton(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(LoginController.self)") as! LoginController
        navigationController?.show(controller, sender: nil)
    }
    @IBAction func registerAction(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { [weak self]
                result, error in
                if let error = error {
                    print(error.localizedDescription)
                } else if let user = result?.user {
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
