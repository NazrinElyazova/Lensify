//
//  AlertExtension.swift
//  Lensify
//
//  Created by Nazrin on 24.02.24.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
             let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
             alertController.addAction(okButton)
             alertController.addAction(cancelButton)
        self.present(alertController, animated: true, completion: nil)
    }
}

