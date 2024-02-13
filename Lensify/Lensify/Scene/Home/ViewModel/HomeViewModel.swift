//
//  HomeViewModel.swift
//  Lensify
//
//  Created by Nazrin on 14.01.24.
//

import Foundation

class HomeViewModel {
    
    var items = [GetTopics]()
    
    var topicItems = [TopicElement]()
    
    var onSuccess: (()-> Void)?
    var topicSuccess: (()-> Void)?
    var onError: ((String)-> Void)?
    
    private let manager = HomeManager()
    
    func getTopics() {
        manager.getTopics { data, errorMessage in
            if let errorMessage {
                self.onError?(errorMessage)
            } else if let data {
                self.topicItems = data
                self.topicSuccess?()
            }
        }
    }
    
    func getPhotos(id: String, limit: Int) {
        /*manager.getHomeList(id: id, endpoint: HomeEndpoint.topics)*/
        let currentPage = (items.count / limit) + 1
        manager.getHomeList(pageNumber: currentPage, limit: limit, id: id) {
            data, errorMessage in
            if let errorMessage = errorMessage {
                self.onError?(errorMessage)
            } else if let data = data {
                //                self.items = data
                //                self.onSuccess?()
                //            }
                let existingId = Set(self.items.map {
                    $0.id
                })
                let newResults = data.filter {
                    !existingId.contains($0.id)
                }
                self.items += newResults
                self.onSuccess?()
            }
        }
        
    }
    func pagination(id: String) {
        let limit = 10
        getPhotos(id: id, limit: limit)
    }
}

