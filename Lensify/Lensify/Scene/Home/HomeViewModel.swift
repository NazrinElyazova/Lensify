//
//  HomeViewModel.swift
//  Lensify
//
//  Created by Nazrin on 14.01.24.
//

import Foundation

class HomeViewModel {
    var items = [Wallpapers]()
    
    var onSuccess: (()-> Void)?
    var onError: ((String)-> Void)?
    
    private let manager = HomeManager()
    
    func getHomePhotos() {
        self.getPhotos(endpoint: HomeEndpoint.wallpaper)
    }
    func getPhotos(endpoint: HomeEndpoint) {
        manager.getHomeList(endpoint: endpoint) {
            data, errorMessage in
            if let errorMessage = errorMessage {
                self.onError?(errorMessage)
            } else if let data = data {
                self.items.append(contentsOf: data)
                self.onSuccess?()
            }
        }
    }
}
