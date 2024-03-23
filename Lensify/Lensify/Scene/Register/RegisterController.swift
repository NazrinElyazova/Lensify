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
    
    let databaseAdapter = DatabaseAdapter()
    let facebookButton = FBLoginButton()
    
    var completion: ((String, String)-> Void)?
    var adapter: LoginAdapter?
    
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var alreadyHaveAccountLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var yourJourneyLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapterSave()
        faceButton()
        hideTitle()
        configureExtensionButton(button: registerButton)
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        translateText()
    }
    
    @IBAction func googleButtonAction(_ sender: Any) {
        adapter?.login(type: .google)
        self.adapter?.success = {
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "\(ReadyForDownloadController.self)") as! ReadyForDownloadController
            self.navigationController?.show(controller, sender: nil)
            self.login()
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
                guard let self else {return}
                if let error = error {
                    print(error.localizedDescription)
                } else if let user = result?.user {
                    completion?(user.email ?? "", password)
                    navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    func configureUI() {
        googleButton.clipsToBounds = true
        googleButton.layer.cornerRadius = 20
        registerButton.clipsToBounds = true
        emailTextField.clipsToBounds = true
        passwordTextField.clipsToBounds = true
        registerButton.layer.cornerRadius = 20
        emailTextField.layer.cornerRadius = 20
        passwordTextField.layer.cornerRadius = 20
    }
    
    func faceButton() {
        stackView.axis = .vertical
        stackView.addArrangedSubview(facebookButton)
        
        facebookButton.addTarget(self, action: #selector(facebookButonTapped), for: .touchUpInside)
        facebookButton.permissions = ["public_profile", "email"]
        facebookButton.layer.cornerRadius = 20.0
        facebookButton.layer.masksToBounds = true
    }
    
    @objc func facebookButonTapped() {
        adapter?.login(type: .facebook)
        self.adapter?.success = { 
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "\(ReadyForDownloadController.self)") as! ReadyForDownloadController
            self.navigationController?.show(controller, sender: nil)
            self.login()
        }
    }
    
    func adapterSave() {
        adapter = LoginAdapter(controller: self)
        adapter?.completion = { [weak self]
            user in
            self?.databaseAdapter.saveUserInfo(data: user)
        }
    }
    
    func translateText() {
        passwordTextField.placeholder = "passwordTextField".localize
        emailTextField.placeholder = "emailTextField".localize
        registerButton.setTitle("registerButton".localize, for: .normal)
        alreadyHaveAccountLabel.text = "alreadyHaveAccount".localize
        yourJourneyLabel.text = "yourJourney".localize
        loginButton.setTitle("loginButton".localize, for: .normal)
    }
}
