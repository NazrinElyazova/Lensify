////
////  HomeViewModel.swift
////  Lensify
////
////  Created by Nazrin on 14.01.24.
////
//
import Combine
import Foundation

class HomeViewModel {
    let manager = HomeManager()
    
    var items = [GetTopics]()
    var onSuccess: PassthroughSubject<Void, Never> = PassthroughSubject<Void, Never>()
    var onError: PassthroughSubject<String, Never> = PassthroughSubject<String, Never>()
    var currentItems = [GetTopics]()
    var topicSuccess: (()-> Void)?
    var cancellables = Set<AnyCancellable>()
    
    var topicItems = [TopicElement]()
    var page = 1
    var topicId: String? {
        didSet {
            getPhotos()
        }
    }
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        onSuccess
            .sink {_ in
            }
            .store(in: &cancellables)
        
        onError
            .sink {_ in
            }
            .store(in: &cancellables)
    }
    
    func getTopics() {
        manager.getTopics() { data, errorMessage in
            if let errorMessage = errorMessage {
                self.onError.send(errorMessage)
            } else if let data = data {
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
                self.onError.send(errorMessage)
            } else if let data = data {
                self.currentItems = data
                self.items.append(contentsOf: data)
                self.onSuccess.send()
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
