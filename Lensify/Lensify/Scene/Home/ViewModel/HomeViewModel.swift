//
//  HomeViewModel.swift
//  Lensify
//
//  Created by Nazrin on 14.01.24.
//

import Foundation

class HomeViewModel {
    private let manager = HomeManager()

    var items = [GetTopics]()
    var onSuccess: (()-> Void)?
    var topicSuccess: (()-> Void)?
    var onError: ((String)-> Void)?
    var currentItems = [GetTopics]()
    var topicItems = [TopicElement]()
        
    var page = 1
    var topicId: String? {
        didSet {
            getPhotos()
        }
    }
    
    func getTopics() {
        manager.getTopics() { data, errorMessage in
            if let errorMessage {
                self.onError?(errorMessage)
            } else if let data {
                self.topicItems = data
                self.topicId = data.first?.id
                self.topicSuccess?()
            }
        }
    }
    
    func getPhotos() {
        manager.getHomeList(pageNumber: page, id: topicId ?? "") {
            data, errorMessage in
            if let errorMessage = errorMessage {
                self.onError?(errorMessage)
            } else if let data = data {
                self.currentItems = data
                self.items.append(contentsOf: data)
                self.onSuccess?()
            }
        }
        
    }
    
    func pagination(index: Int) {
        if index == items.count-1 && !currentItems.isEmpty {
            page += 1
            getPhotos()
        }
    }
}

