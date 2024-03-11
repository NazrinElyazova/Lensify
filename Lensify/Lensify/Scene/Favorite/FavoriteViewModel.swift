//
//  FavoriteViewModel.swift
//  Lensify
//
//  Created by Nazrin on 06.03.24.
//

import Foundation
class FavoriteViewModel {
    
    private let manager = FavoriteManager()
    
    var detail = [GetTopics]()
    var onSuccess: (()-> Void)?
    var onError: ((String)-> Void)?
    
    var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func getDetailPhoto() {
        manager.getPhotoDetail(photoID: id) { data, errorMessage in
            if let errorMessage {
                self.onError?(errorMessage)
            } else if let data {
                self.detail = data
                self.onSuccess?()
            }
        }
    }
}
