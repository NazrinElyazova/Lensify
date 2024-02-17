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
    
    var page = 1
    var limit = 10
    
    var shouldMoreLoad: Bool = true {
        didSet {
            if shouldMoreLoad,  search.count > limit {
                page += 1
            }
        }
    }
    
    func getSearchItems(searchText: String, limit: Int) {
        
      manager.getSearchItems(limit: limit, pageNumber: page, searchText: searchText) {
       
            data, errorMessage in
//            print("==========")
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
        page = 1
        getSearchItems(searchText: searchText,  limit: limit)
    }
}
