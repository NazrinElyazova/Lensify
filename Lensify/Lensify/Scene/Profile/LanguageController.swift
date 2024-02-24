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
    
    var local = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chooseLanguageLabel.text = "chooseLanguage".localize
    }
    func changeAppLanguage(language: String) {
        UserDefaults.standard.setValue(language, forKey: "localizedLanguage")
        
    }
    
    @IBAction func engTappedAction(_ sender: Any) {
        changeAppLanguage(language: "en")
        showAlert(title: "", message: "You changed your app's language to English.")
    }
    
    @IBAction func azeTappedAction(_ sender: Any) {
        changeAppLanguage(language: "az")
        showAlert(title: "", message: "Tətbiqin dilini Azərbaycan dilinə dəyişdiniz.")

    }
    
    @IBAction func spanishTappedAction(_ sender: Any) {
        changeAppLanguage(language: "es")
        showAlert(title: "", message: "Cambiaste el idioma de tu aplicación a español.")
    }
}
