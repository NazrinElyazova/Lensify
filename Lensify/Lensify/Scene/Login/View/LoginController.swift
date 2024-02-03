//
//  LoginController.swift
//  Lensify
//
//  Created by Nazrin on 31.01.24.
//

import UIKit
import FirebaseFirestoreInternal

class LoginController: UIViewController {
    
    var adapter: LoginAdapter?
    var databaseAdapter = DatabaseAdapter()
    
    let database = Firestore.firestore()
    
    var info = [UserInfo]()
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameEmailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserInfo()
        
        adapter = LoginAdapter(controller: self)
        
        adapter?.completion = {
            user in
            
            self.databaseAdapter.saveUserInfo(data: user)
            //            print(user)
            //save to coredata
        }
    }
    @IBAction func loginSegment(_ sender: Any) {
        
        if (sender as AnyObject).selectedSegmentIndex == 0 {
            print("First")
        } else if (sender as AnyObject).selectedSegmentIndex == 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "\(RegisterController.self)") as! RegisterController
            navigationController?.show(controller, sender: nil)
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
        if !(passwordTextField.text?.isEmpty == true), !(userNameEmailTextField.text?.isEmpty == true) {
            print("bos deyillllllerrr")
          
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
    
    @IBAction func googleButtonAction(_ sender: Any) {
        adapter?.login(type: .google)
    }
    @IBAction func facebookButtonAction(_ sender: Any) {
    }
    @IBAction func appleButtonAction(_ sender: Any) {
    }
}

