//
//  AlertExtension.swift
//  Lensify
//
//  Created by Nazrin on 24.02.24.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert() {
        let alertController = UIAlertController(title: "Warning!", message: "You have no account. Please, login.", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { _ in
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "\(LoginController.self)") as! LoginController
            self.navigationController?.show(controller, sender: nil)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension UIViewController {
    
    func showLanguageAlert(title: String, message: String, okButton: UIAlertAction, cancelButton: UIAlertAction) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        self.present(alertController, animated: true, completion: nil)
    }
}
