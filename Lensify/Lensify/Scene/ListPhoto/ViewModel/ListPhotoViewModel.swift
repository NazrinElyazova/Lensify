//
//  ListPhotoViewModel.swift
//  Lensify
//
//  Created by Nazrin on 06.02.24.
//

import Foundation

class ListPhotoViewModel {
    
    var items = [List]()
    
    var error: ((String)->Void)?
    var success: (()->Void)?
    
    private let manager = ListPhotoManager()
    
    func listPhoto() {
        manager.getListPhotos {
            data, errorMessage in
            if let errorMessage = errorMessage {
                self.error?(errorMessage)
            } else if let data = data {
//                self.items.append(data)
                self.items.append(contentsOf: data)
//                self.items = data
                self.success?()
            }
        }
    }
}
