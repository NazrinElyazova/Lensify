//
//  NatureManager.swift
//  Lensify
//
//  Created by Nazrin on 27.01.24.
//

import Foundation

class NatureManager: NatureUseCase {
    func getNatureList(endpoint: NatureEndpoint, completion: @escaping (([Photo]?, String?) -> Void)) {
        NetworkManager.request(model: [Photo].self, endpoint: endpoint.rawValue) {
            data, errorMessage in
            if let errorMessage = errorMessage {
                completion(nil, errorMessage)
            } else if let data = data {
                completion(data, nil)
            }
        }
    }
    
    
}
