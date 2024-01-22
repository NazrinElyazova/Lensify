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
        self.getPhotos(endpoint: HomeEndpoint.topics, id: "")
    }
    func getPhotos(endpoint: HomeEndpoint, id: String?) {
        let url = HomeEndpoint.topics.rawValue + "\(id ?? "")/photos"
    /*    NetworkManager.request(model: Wallpapers.self, endpoint: url)*/ 
        manager.getHomeList(id: "", endpoint: .topics) {
            data, errorMessage in
            if let errorMessage = errorMessage {
                self.onError?(errorMessage)
            } else if let data = data {
//                self.items.append(contentsOf: data)
//                self.items = data
                self.items.append(contentsOf: data)
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
