//
//  ProfileController.swift
//  Lensify
//
//  Created by Nazrin on 20.02.24.
//

import UIKit

class ProfileController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func termsButton(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(TermsAndConditionsController.self)") as! TermsAndConditionsController
        navigationController?.show(controller, sender: nil)
    }
    
    @IBAction func aboutLensifyAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(AboutLensifyController.self)") as! AboutLensifyController
        navigationController?.show(controller, sender: nil)
    }
}