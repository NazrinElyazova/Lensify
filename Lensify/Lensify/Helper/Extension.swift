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
    
//    static func urlConfiguration(endpoint: String) -> String {
//        NetworkHelper.baseURL + endpoint + "?client_id=\(NetworkHelper.clientId)"
//    }
    
    func loadImage(url: String){
//        let path = "\(NetworkHelper.imagePath)\(url)"
        
        if let finalURL = URL(string: url) {
            self.kf.setImage(with: finalURL)
        }
    }
}

extension UIView {
    static func loadFromNib() -> Self {
        return Bundle(for: self).loadNibNamed(String(describing: self), owner: nil, options: nil)![0] as! Self
    }
}
