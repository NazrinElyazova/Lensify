//
//  HomeManager.swift
//  Lensify
//
//  Created by Nazrin on 17.01.24.
//

import Foundation
class HomeManager {
    func getHomeList(endpoint: HomeEndpoint, completion: @escaping(([Wallpapers]?, String?)->Void)) {
        NetworkManager.request(model: [Wallpapers].self,
                               endpoint: endpoint.rawValue) {
            data, errorMessage in
            if let errorMessage = errorMessage {
                completion(nil, errorMessage)
            }
            else if let data = data {
                completion(data, nil)
            }
        }
        
    }
}
