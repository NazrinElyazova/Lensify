//
//  Extension.swift
//  Lensify
//
//  Created by Nazrin on 13.01.24.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
    func loadImage(url: String){
        let path = "\(NetworkHelper.imagePath)\(url)"
        if let finalURL = URL(string: url) {
            self.kf.setImage(with: finalURL)
        }
    }
}
