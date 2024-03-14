//
//  ProfileController.swift
//  Lensify
//
//  Created by Nazrin on 20.02.24.
//

import UIKit

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
    
    @IBAction func privacyButton(_ sender: Any) {
        goToSafariViewController(url: "https://www.livintis.com/wallpapers-privacy-policy")
    }
    
    @IBAction func termsButton(_ sender: Any) {
        goToSafariViewController(url: "https://wallpapers-app-terms.nethouse.ru/")
    }
    
    @IBAction func aboutLensifyAction(_ sender: Any) {
        goToSafariViewController(url: "https://unsplash.com/wallpapers/apps")
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
            UserDefaults.standard.set(false, forKey: "loggedIn")
            sceneDelegate.logout(windowScene: scene)
        }
    }
}

