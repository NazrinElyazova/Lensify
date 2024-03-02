//
//  ProfileController.swift
//  Lensify
//
//  Created by Nazrin on 20.02.24.
//

import UIKit
import Firebase


class ProfileController: UIViewController {
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var privacyPolicyButton: UIButton!
    @IBOutlet weak var aboutLensifyButton: UIButton!
    @IBOutlet weak var termsConditionsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        translateTitle()
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        logout()
    }
    
    @IBAction func termsButton(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(TermsAndConditionsController.self)") as! TermsAndConditionsController
        navigationController?.show(controller, sender: nil)
    }
    
    @IBAction func aboutLensifyAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(AboutLensifyController.self)") as! AboutLensifyController
        navigationController?.show(controller, sender: nil)
    }
    
  
    
    func translateTitle() {
        navigationItem.title = "listTitle".localize
        privacyPolicyButton.setTitle("privacyPolicy".localize, for: .normal)
        termsConditionsButton.setTitle("termsConditions".localize, for: .normal)
        aboutLensifyButton.setTitle("aboutLensify".localize, for: .normal)
        logoutButton.setTitle("logout".localize, for: .normal)
    }
    func configureButton() {
        logoutButton.titleLabel?.font = .systemFont(ofSize: 28.0, weight: .bold)
        logoutButton.backgroundColor = .systemRed
        logoutButton.layer.cornerRadius = 10
    }
    func logout() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = scene.delegate as? SceneDelegate {
            UserDefaults.standard.set(false, forKey: "loggedIn") // Setting the flag
            sceneDelegate.logout(windowScene: scene)
        }
    }
}
