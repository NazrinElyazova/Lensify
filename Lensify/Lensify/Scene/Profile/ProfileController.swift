//
//  ProfileController.swift
//  Lensify
//
//  Created by Nazrin on 20.02.24.
//

import UIKit
//import Firebase
import SafariServices


class ProfileController: UIViewController {
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var privacyPolicyButton: UIButton!
    @IBOutlet weak var aboutLensifyButton: UIButton!
    @IBOutlet weak var termsConditionsButton: UIButton!
    
    let customText = "Welcome to Lensify, a wallpaper application provided by Lensify. By accessing or using Lensify, you agree to comply with and be bound by the following terms and conditions. If you do not agree to these Terms, please do not use the App"
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
        guard let url = URL(string: "https://www.lensifyapp.com/terms-and-conditions") else { return }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
    @IBAction func aboutLensifyAction(_ sender: Any) {
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
