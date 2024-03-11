//
//  UserDefaultsExtension.swift
//  Lensify
//
//  Created by Nazrin on 11.03.24.
//

import Foundation
import UIKit

extension UIViewController {
    func login() {
        UserDefaults.standard.set(true, forKey: "loggedIn")
    }
}
