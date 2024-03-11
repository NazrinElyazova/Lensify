//
//  LoginController.swift
//  Lensify
//
//  Created by Nazrin on 31.01.24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestoreInternal
import FBSDKLoginKit

class LoginController: UIViewController {
    
    let facebookButton = FBLoginButton()
    let database = Firestore.firestore()
    
    var adapter: LoginAdapter?
    var databaseAdapter = DatabaseAdapter()
    var info = [UserInfo]()
    var success: (() -> Void)?
    
    @IBOutlet weak var dontHaveAccountLabel: UILabel!
    @IBOutlet weak var orSignupWithLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var unleashLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var userNameEmailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideTitle()
        configureExtensionButton(button: loginButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        translateText()
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(RegisterController.self)") as! RegisterController
        
        controller.completion = { [weak self] email, password in
            self?.passwordTextField.text = password
            self?.userNameEmailTextField.text = email
        }
        navigationController?.show(controller, sender: nil)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        if !(passwordTextField.text?.isEmpty == true), !(userNameEmailTextField.text?.isEmpty == true),
           let email = userNameEmailTextField.text,
           let password = passwordTextField.text {
            let controller = storyboard?.instantiateViewController(withIdentifier: "\(ReadyForDownloadController.self)") as! ReadyForDownloadController
            navigationController?.show(controller, sender: nil)
            getUserInfo()
            adapterSave()
        }
    }
    
    func adapterSave() {
        adapter = LoginAdapter(controller: self)
        adapter?.completion = {
            user in
            self.databaseAdapter.saveUserInfo(data: user)
            self.login()
        }
    }
    
    func getUserInfo() {
        database.collection("UserInfo").getDocuments { snapshot, error in
            
            for document in snapshot?.documents ?? [] {
                let dict = document.data()
                
                if let data = try? JSONSerialization.data(withJSONObject: dict) {
                    guard let info = try? JSONDecoder().decode(UserInfo.self, from: data) else { return }
                    self.info.append(info)
                }
            }
        }
    }
    
    func translateText() {
        unleashLabel.text = "unleashLabel".localize
        loginButton.setTitle("loginButton".localize, for: .normal)
        passwordTextField.placeholder = "passwordTextField".localize
        userNameEmailTextField.placeholder = "emailTextField".localize
        orSignupWithLabel.text = "orSignupWithLabel".localize
        dontHaveAccountLabel.text = "dontHaveAccountLabel".localize
        registerButton.setTitle("registerButton".localize, for: .normal)
    }
}
