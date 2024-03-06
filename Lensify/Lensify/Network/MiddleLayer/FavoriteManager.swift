//
//  FavoriteManager.swift
//  Lensify
//
//  Created by Nazrin on 06.03.24.
//

import Foundation
class FavoriteManager: FavoriteUseCase {
    func getPhotoDetail(completion: @escaping (([TopicElement]?, String?) -> Void)) {
        
        let url =  NetworkHelper.urlConfiguration(endpoint: HomeEndpoint.topics.rawValue)
        NetworkManager.request(model: [TopicElement].self, endpoint: url, completion: completion)
    }
}
