//
//  SearchManager.swift
//  Lensify
//
//  Created by Nazrin on 31.01.24.
//

import Foundation

class SearchManager: SearchUseCase {
   
    
    func getSearchItems(endpoint: SearchEndpoint, completion: @escaping ((Search?, String?) -> Void)) {
        
//        let path = SearchEndpoint.search.rawValue + "?query=\(searchText)"
        NetworkManager.request(model: Search.self, endpoint: SearchEndpoint.search.rawValue, completion: completion)
//
        }
    }
