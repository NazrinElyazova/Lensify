//
//  HomeManager.swift
//  Lensify
//
//  Created by Nazrin on 17.01.24.
//

import Foundation
class HomeManager: HomeUseCse {
    func getHomeList(id: String?, endpoint: HomeEndpoint, completion: @escaping (([Wallpapers]?, String?) -> Void)) {
//        let url = HomeEndpoint.topics.rawValue + "\(id ?? "")/photos"
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
        // COOOX VACIBDIRRR ID MESELESI
    
    func getTopicPhotos(id: String, completion: @escaping (([Wallpapers]?, String?) -> Void)) {
//        let url = HomeEndpoint.topics.rawValue + "\(id)/photos"
//        print("urlimiz: \(url)")
//        NetworkManager.request(model: [Wallpapers].self, endpoint: url) { <#(Decodable & Encodable)?#>, <#String?#> in
//            <#code#>
//        }
    }
}
