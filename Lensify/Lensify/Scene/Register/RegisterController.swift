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
    
    var successLogin:((String, String)-> Void)?
    
    var adapter: LoginAdapter?
    let databaseAdapter = DatabaseAdapter()
    let facebookButton = FBLoginButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register Now !"
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
        facebookButton.permissions = ["public_profile", "email"]
        facebookButton.layer.cornerRadius = 20
        adapter?.login(type: .facebook)
        adapter?.completion = { user in
            self.emailTextField.text = user.email
            self.passwordTextField.text = user.password
            
        }
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
                    //                    print(user)
                    //                    self?.credential()
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
    //    func credential() {
    //        NotificationCenter.default.addObserver(self, selector: #selector(handleGoogleSignIn(_:)), name: .AuthStateDidChange, object: nil)
    //
    ////        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: <#T##String#>)
    //    }
    //    @objc func handleGoogleSignIn(_ notification: Notification) {
    //          guard let userInfo = notification.userInfo,
    //              let user = Auth.auth().currentUser else {
    //                  return
    //          }
    //    }
    func singIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            else if let _ = result?.user {
                print("user movcuddur")
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "\(ReadyForDownloadController.self)") as! ReadyForDownloadController
                self.singIn(email: email, password: password)
                self.navigationController?.show(controller, sender: nil)
            }
        }
    }
}
