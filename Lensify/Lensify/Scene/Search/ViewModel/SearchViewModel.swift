//
//  SearchViewModel.swift
//  Lensify
//
//  Created by Nazrin on 16.01.24.
//

import Foundation

class SearchViewModel {
    let manager = SearchManager()
    
    var searchData: Search?
    var search = [SearchResult]()
    var onSucces: (()->Void)?
    var onError: ((String)-> Void)?
    
    var page = 1
    var searchText: String? {
        didSet {
            getSearchItems()
        }
    }
    
    func getSearchItems() {
        manager.getSearchItems(pageNumber: page, searchText: searchText ?? "") { data, errorMessage in
            if let errorMessage = errorMessage {
                self.onError?(errorMessage)
            } else if let data = data {
                self.searchData = data
                self.search.append(contentsOf: data.results ?? [])
                self.onSucces?()
            }
        }
    }
    
    func pagination(index: Int) {
        if index == search.count-1 && page <= (searchData?.totalPages ?? 0) {
            page += 1
            getSearchItems()
        }
    }
}
