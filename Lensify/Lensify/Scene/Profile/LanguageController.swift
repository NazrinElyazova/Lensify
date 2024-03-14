//
//  LanguageController.swift
//  Lensify
//
//  Created by Nazrin on 23.02.24.
//

import UIKit

class LanguageController: UIViewController {
    
    @IBOutlet weak var chooseLanguageLabel: UILabel!
    @IBOutlet weak var spanishButton: UIButton!
    @IBOutlet weak var azeButton: UIButton!
    @IBOutlet weak var engButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chooseLanguageLabel.text = "chooseLanguage".localize
    }
    
    @IBAction func engTappedAction(_ sender: Any) {
        changeAppLanguage(language: "en")
        showLanguageAlert(title: "", message: "You changed your app's language to English.", okButton: UIAlertAction(title: "Ok", style: .default) { _ in
            self.goToLoginController()
        }, cancelButton: UIAlertAction(title: "Cancel", style: .cancel))
    }
    
    @IBAction func azeTappedAction(_ sender: Any) {
        changeAppLanguage(language: "az")
        showLanguageAlert(title: "", message: "Tətbiqin dilini Azərbaycan dilinə dəyişdiniz.", okButton: UIAlertAction(title: "Tamam", style: .default) { _ in
            self.goToLoginController()
            
        }, cancelButton: UIAlertAction(title: "Ləğv et", style: .cancel))
    }
    
    @IBAction func spanishTappedAction(_ sender: Any) {
        changeAppLanguage(language: "es")
        showLanguageAlert(title: "", message: "Cambiaste el idioma de tu aplicación a español.", okButton: UIAlertAction(title: "De acuerdo", style: .default) { _ in
            self.goToLoginController()
            
        }, cancelButton: UIAlertAction(title: "Cancelar", style: .cancel))
    }
    
    func changeAppLanguage(language: String) {
        UserDefaults.standard.setValue(language, forKey: "localizedLanguage")
    }
    
    func goToLoginController() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(LoginController.self)") as! LoginController
        present(UINavigationController(rootViewController: controller), animated: true)
    }
}
