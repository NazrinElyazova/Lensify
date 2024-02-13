//
//  HomeManager.swift
//  Lensify
//
//  Created by Nazrin on 17.01.24.
//

import Foundation

class HomeManager: HomeUseCase {
    func getTopics(completion: @escaping (([TopicElement]?, String?) -> Void)) {
        //        NetworkManager.request(model: [TopicElement].self,
        //                               endpoint: HomeEndpoint.topics.rawValue,
        //                               completion: completion)
        let url =  NetworkHelper.urlConfiguration(endpoint: HomeEndpoint.topics.rawValue)
        
        NetworkManager.request(model: [TopicElement].self, endpoint: url, completion: completion)
    }
    func getHomeList(pageNumber: Int, limit: Int, id: String, completion: @escaping (([GetTopics]?, String?) -> Void)) {
        //        let url = endpoint.rawValue + "\(id)/photos"
        //        NetworkManager.request(model: [Wallpapers].self,
        //                               endpoint: url) {
        let path = NetworkHelper.urlConfiguration(endpoint: "\(HomeEndpoint.topics.rawValue)\(id)/photos") + "&page=\(pageNumber)"
        //        let path = url + "&\(id)/photos"
        
        NetworkManager.request(model: [GetTopics].self, endpoint: path) {
            data, errorMessage in
            if let errorMessage = errorMessage {
                completion(nil, errorMessage)
            }
            else if let data = data {
                completion(data, nil)
            }
        }
    }
    // COOOX VACIBDIRRR ID
    //        let url = HomeEndpoint.topics.rawValue + "\(id)/photos"
}
