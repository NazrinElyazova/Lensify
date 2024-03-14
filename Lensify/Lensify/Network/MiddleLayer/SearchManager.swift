//
//  SearchManager.swift
//  Lensify
//
//  Created by Nazrin on 31.01.24.
//

import Foundation

class SearchManager: SearchUseCase {
    
    func getSearchItems(pageNumber: Int, searchText: String, completion: @escaping ((Search?, String?) -> Void)) {
        
        let url = NetworkHelper.urlConfiguration(endpoint: SearchEndpoint.search.rawValue)
        let path = url + "&query=\(searchText)" + "&page=\(pageNumber)"
        NetworkManager.request(model: Search.self, endpoint: path, completion: completion)
        
    }
}
