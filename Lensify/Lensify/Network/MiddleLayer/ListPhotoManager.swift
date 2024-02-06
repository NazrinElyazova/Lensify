//
//  ListPhotoManager.swift
//  Lensify
//
//  Created by Nazrin on 06.02.24.
//

import Foundation
class ListPhotoManager: ListPhotoUseCase {
    func getListPhotos(completion: @escaping (([List]?, String?) -> Void)) {
      
        let url = NetworkHelper.urlConfiguration(endpoint: ListPhotoEndpoint.listphoto.rawValue)
        NetworkManager.request(model: [List].self, endpoint: url, completion: completion)
    }
    
    
}
