//
//  ProfileController.swift
//  Lensify
//
//  Created by Nazrin on 20.02.24.
//

import UIKit

class ProfileController: UIViewController {
    
    @IBOutlet weak var languagesButton: UIButton!
    @IBOutlet weak var privacyPolicyButton: UIButton!
    @IBOutlet weak var aboutLensifyButton: UIButton!
    @IBOutlet weak var termsConditionsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        translateTitle()
    }
    @IBAction func termsButton(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(TermsAndConditionsController.self)") as! TermsAndConditionsController
        navigationController?.show(controller, sender: nil)
    }
    @IBAction func aboutLensifyAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(AboutLensifyController.self)") as! AboutLensifyController
        navigationController?.show(controller, sender: nil)
    }
    @IBAction func languagesAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(LanguageController.self)") as! LanguageController
        navigationController?.show(controller, sender: nil)
    }
    func translateTitle() {
        navigationItem.title = "listTitle".localize
        languagesButton.setTitle("language".localize, for: .normal)
        privacyPolicyButton.setTitle("privacyPolicy".localize, for: .normal)
        termsConditionsButton.setTitle("termsConditions".localize, for: .normal) 
        aboutLensifyButton.setTitle("aboutLensify".localize, for: .normal)
    }
}
