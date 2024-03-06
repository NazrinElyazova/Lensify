//
//  SafariExtension.swift
//  Lensify
//
//  Created by Nazrin on 06.03.24.
//

import Foundation
import UIKit
import SafariServices

extension UIViewController {
    func goToSafariViewController(url: String) {
        guard let url = URL(string: url) else { return }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
}
