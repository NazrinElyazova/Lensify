//
//  SearchViewModel.swift
//  Lensify
//
//  Created by Nazrin on 16.01.24.
//

import Foundation

class SearchViewModel {
    let manager = SearchManager()
    
    var search = [SearchResult]()
    var onSucces: (()->Void)?
    var onError: ((String)-> Void)?
    
    func getSearchItems(searchText: String, limit: Int) {
        //        let path = SearchEndpoint.search.rawValue + "?query=\(searchText)"
        let currentPage = (search.count / limit) + 1
//
        manager.getSearchItems(limit: limit, pageNumber: currentPage, searchText: searchText) {
       
            data, errorMessage in
            print("==========")
            if let errorMessage = errorMessage {
                self.onError?(errorMessage)
            } else if let data = data {
                let existingIds = Set(self.search.map {
                    $0.id
                })
                let newResults = data.results?.filter {
                    !existingIds.contains($0.id)
                } ?? []
                self.search += newResults
                self.onSucces?()
            }
        }
    }
    func pagination(searchText: String) {
        let limit = 10
        getSearchItems(searchText: searchText, limit: limit)
    }
}
