//
//  ViewControllerExtension.swift
//  Lensify
//
//  Created by Nazrin on 23.03.24.
//

import Foundation
import UIKit

//MARK: User Defaults
extension UIViewController {
    func login() {
        UserDefaults.standard.set(true, forKey: "loggedIn")
    }
}

//MARK: Hide Title
extension UIViewController {
    func hideTitle() {
        self.navigationController?.navigationBar.topItem?.title = ""
    }
}

//MARK: Gradient Color
extension UIViewController {
    func setGradientColor() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.purple.cgColor,  UIColor.systemPink.cgColor, UIColor.blue.cgColor, UIColor.yellow.cgColor, UIColor.red.cgColor, UIColor.green.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.7, y: 0.3)
        gradientLayer.endPoint = CGPoint(x: 0.2, y: 1.3)
        
        view.layer.addSublayer(gradientLayer)
    }
}

