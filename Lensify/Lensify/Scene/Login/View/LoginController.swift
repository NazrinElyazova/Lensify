//
//  LoginController.swift
//  Lensify
//
//  Created by Nazrin on 31.01.24.
//

import GoogleSignIn
import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestoreInternal
import FBSDKLoginKit

class LoginController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameEmailTextField: UITextField!
    
    var adapter: LoginAdapter?
    var databaseAdapter = DatabaseAdapter()
    
    let facebookButton = FBLoginButton()
    let database = Firestore.firestore()
    
    var info = [UserInfo]()
    var success: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        title = "Welcome"
        //        getUserInfo()
        //        adapterSave()
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    func login() {
        UserDefaults.standard.set(true, forKey: "loggedIn")
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(RegisterController.self)") as! RegisterController
        
        controller.completion = { [weak self] email, password in
            self?.passwordTextField.text = password
            self?.userNameEmailTextField.text = email
        }
        navigationController?.show(controller, sender: nil)
    }
    func adapterSave() {
        adapter = LoginAdapter(controller: self)
        
        adapter?.completion = {
            user in
            self.login()
            self.databaseAdapter.saveUserInfo(data: user)
            print(user)
            //save to firebase
            
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
    @IBAction func loginButtonAction(_ sender: Any) {
        if !(passwordTextField.text?.isEmpty == true), !(userNameEmailTextField.text?.isEmpty == true),
           let email = userNameEmailTextField.text,
           let password = passwordTextField.text {
            let controller = storyboard?.instantiateViewController(withIdentifier: "\(ReadyForDownloadController.self)") as! ReadyForDownloadController
            navigationController?.show(controller, sender: nil)
            getUserInfo()
            adapterSave()
            login()
        } else {
            showAlert()
        }
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Warning !", message: "Please, fill your information.", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
    }
}
