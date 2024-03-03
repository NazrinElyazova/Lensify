//
//  DetailManager.swift
//  Lensify
//
//  Created by Nazrin on 02.03.24.
//

import Foundation

class DetailManager: DetailUseCase {
    func getPhotoDetail(photoID: String?, completion: @escaping (([TopicElement]?, String?) -> Void)) {
        
        let url =  NetworkHelper.urlConfiguration(endpoint: HomeEndpoint.topics.rawValue)
        NetworkManager.request(model: [TopicElement].self, endpoint: url, completion: completion)
    }
}
