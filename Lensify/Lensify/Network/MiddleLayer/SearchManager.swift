//
//  SearchManager.swift
//  Lensify
//
//  Created by Nazrin on 31.01.24.
//

import Foundation

class SearchManager: SearchUseCase {
    
    func getSearchItems(searchText: String, endpoint: SearchEndpoint, completion: @escaping ((Search?, String?) -> Void)) {
        
        let path = SearchEndpoint.search.rawValue + "?query=\(searchText)"
        NetworkManager.request(model: Search.self, endpoint: path) {
            data, errorMessage in
            
            if let errorMessage = errorMessage {
                completion(nil, errorMessage)
            }
            else if let data = data {
                completion(data, nil)
            }
        }
    }
}
