//
//  HomeViewModel.swift
//  Lensify
//
//  Created by Nazrin on 14.01.24.
//

import Foundation

class HomeViewModel {
    var items = [Wallpapers]()
//    var wallpapersData: Wallpapers?
    
    var onSuccess: (()-> Void)?
    var onError: ((String)-> Void)?
    
    private let manager = HomeManager()
    
    func getHomePhotos() {
        self.getPhotos(endpoint: HomeEndpoint.topics)
    }
    func getPhotos(endpoint: HomeEndpoint) {
        manager.getHomeList(id: "", endpoint: endpoint) {
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
