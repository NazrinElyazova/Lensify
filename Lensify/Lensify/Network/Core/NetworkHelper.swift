//
//  NetworkHelper.swift
//  Lensify
//
//  Created by Nazrin on 13.01.24.
//

import Foundation
import Alamofire
import UIKit

class NetworkHelper {
    static let baseURL = "https://api.unsplash.com/"
    static let clientId = "QDkrKxHnXw5_P5WcTxtWfeEbf-XZSntir16cfzE9YSE"
    
    static func urlConfiguration(endpoint: String) -> String {
        baseURL + endpoint + "?client_id=\(clientId)"
    }
    
    
}
