//
//  LanguageController.swift
//  Lensify
//
//  Created by Nazrin on 23.02.24.
//

import UIKit

class LanguageController: UIViewController {

    @IBOutlet weak var spanishButton: UIButton!
    @IBOutlet weak var azeButton: UIButton!
    @IBOutlet weak var engButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func changeAppLanguage(language: String) {
        UserDefaults.standard.setValue(language, forKey: "localizedLanguage")
    }
    
    @IBAction func engTappedAction(_ sender: Any) {
        changeAppLanguage(language: "en")
    }
    
    @IBAction func azeTappedAction(_ sender: Any) {
        changeAppLanguage(language: "az")
    }
    
    @IBAction func spanishTappedAction(_ sender: Any) {
        changeAppLanguage(language:    "es")
    }
}
