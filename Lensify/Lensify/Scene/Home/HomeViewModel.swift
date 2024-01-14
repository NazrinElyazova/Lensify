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
    
    func getPhotos() {
        NetworkManager.request(model: [Wallpapers].self, endpoint: Endpoints.wallpaper.rawValue) {
            data, errorMessage in
            if let errorMessage = errorMessage {
                self.onError?(errorMessage)
            }
            else if let data = data {
                self.items = data
                self.onSuccess?()
            }
        }
    }
}
