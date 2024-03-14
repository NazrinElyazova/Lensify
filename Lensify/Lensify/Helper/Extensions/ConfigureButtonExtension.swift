//
//  ConfigureButtonExtension.swift
//  Lensify
//
//  Created by Nazrin on 25.02.24.
//

import Foundation
import UIKit

extension UIViewController {
    func configureExtensionButton(button: UIButton) {
        //MARK: Blue Color
        let customColor = UIColor(red: 0/255.0, green: 153/255.0, blue: 204/255.0, alpha: 1.0)

        button.titleLabel?.font = .systemFont(ofSize: 25.0, weight: .bold)
        button.backgroundColor = customColor
        button.layer.cornerRadius = 10
    }
}

