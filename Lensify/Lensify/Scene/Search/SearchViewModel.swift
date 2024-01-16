//
//  SearchViewModel.swift
//  Lensify
//
//  Created by Nazrin on 16.01.24.
//

import Foundation

class SearchViewModel {
    var search = [Search]()
    
    var onSucces: (()->Void)?
    var onError: ((String)-> Void)?
    
    func getSearchItems() {
        NetworkManager.request(model: [Search].self, endpoint: Endpoints.search.rawValue) { data, errorMessage in
            if let errorMessage = errorMessage {
                self.onError?(errorMessage)
            } else if let data = data {
                self.search = data
                self.onSucces?()
            }
        }
    }
}
