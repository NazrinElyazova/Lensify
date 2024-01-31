//
//  SearchViewModel.swift
//  Lensify
//
//  Created by Nazrin on 16.01.24.
//

import Foundation

class SearchViewModel {
    var search = [SearchResult]()
    let manager = SearchManager()
    
    var onSucces: (()->Void)?
    var onError: ((String)-> Void)?
    
    func getSearchItems(searchText: String, pageID: Int) {
//        let path = SearchEndpoint.search.rawValue + "?query=\(searchText)"
        /*NetworkManager.request(model: Search.self, endpoint: path) */
        
        manager.getSearchItems(searchText: searchText, endpoint: SearchEndpoint.search)
        { data, errorMessage in
            if let errorMessage = errorMessage {
                self.onError?(errorMessage)
            } else if let data = data {
                self.search = data.results ?? []
                self.onSucces?()
//                print(data)
            }
        }
    }
}
