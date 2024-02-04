//
//  SearchManager.swift
//  Lensify
//
//  Created by Nazrin on 31.01.24.
//

import Foundation

class SearchManager: SearchUseCase {
   
    func getSearchItems(searchText: String, completion: @escaping ((Search?, String?) -> Void)) {
        
//        let path = SearchEndpoint.search.rawValue + "?query=\(searchText)"
        
        let url = NetworkHelper.urlConfiguration(endpoint: SearchEndpoint.search.rawValue)
        let path = url + "&query=\(searchText)"
        NetworkManager.request(model: Search.self, endpoint: path, completion: completion)
//
        }
    }
