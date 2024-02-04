//
//  HomeViewModel.swift
//  Lensify
//
//  Created by Nazrin on 14.01.24.
//

import Foundation

class HomeViewModel {
    
    var items = [Wallpapers]()
    
    var test = [CoverPhotoWallpapers]()
    
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
    
    func getPhotos(id: String) {        
        manager.getHomeList(id: id, endpoint: HomeEndpoint.topics) {
            data, errorMessage in
            if let errorMessage = errorMessage {
                self.onError?(errorMessage)
            } else if let data = data {
                self.items.append(contentsOf: data)
//                self.items = data
//                self.items.append(data)
                self.onSuccess?()
            }
        }
    }
//    func pagination(index: Int) {
//        //current page < total page
//        if index == items.count-2 /*&& (wallpapersData.)*/{
////            getHomePhotos()
//        }
//    }
}
