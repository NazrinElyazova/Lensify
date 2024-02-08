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
    
    var searchData: Search?
    
    var onSucces: (()->Void)?
    var onError: ((String)-> Void)?
    
    func getSearchItems(searchText: String) {
//        let path = SearchEndpoint.search.rawValue + "?query=\(searchText)"
        
        manager.getSearchItems(pageNumber: (searchData?.totalPages ?? 0) + 1, searchText: searchText) {
            
            data, errorMessage in
            if let errorMessage = errorMessage {
                self.onError?(errorMessage)
            } else if let data = data {
                self.search = data.results ?? []
                self.onSucces?()
                //                print(data)
            }
        }
    }
    func pagination(index: Int, searchText: String) {
        guard let total = searchData?.total,
              let totalPages = searchData?.totalPages,
              total > search.count else {return}
            
        let currentPage = (search.count / 10) + 1
        print("Current Page: \(currentPage), Total Pages: \(totalPages), Total Items: \(total), Current Items: \(search.count)")

        if index == search.count - 1 && currentPage < totalPages {
            print("Triggering pagination...")

            getSearchItems(searchText: searchText)
        }
    }
    func reset() {
        searchData = nil
        search.removeAll()
    }
}
