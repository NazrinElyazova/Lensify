//
//  HideTitleExtension.swift
//  Lensify
//
//  Created by Nazrin on 06.03.24.
//

import Foundation
import UIKit

extension UIViewController {
    func hideTitle() {
        self.navigationController?.navigationBar.topItem?.title = ""
    }
}
