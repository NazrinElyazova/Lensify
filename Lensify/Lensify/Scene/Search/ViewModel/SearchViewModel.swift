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
        let currentPage = (search.count / 10) + 1
//
        manager.getSearchItems(pageNumber: currentPage + 1, searchText: searchText) {
       
            data, errorMessage in
            print("==========")
            if let errorMessage = errorMessage {
                self.onError?(errorMessage)
            } else if let data = data {
                self.searchData = data
                self.search = data.results ?? []
                self.onSucces?()
                //                print(data)
            }
        }
    }
    func pagination(index: Int, searchText: String) {
//        // Calculate the current page based on the number of items and items per page
        
        //MARK: Current page < Total Page
        let currentPage = (search.count / 10) + 1
//        let currentPage = (searchData?.total/searchData?.totalPages)
//        var page = Int()
        if index == search.count-1 && currentPage <= searchData?.totalPages ?? 0 {
          print("+++++++++++++")
            getSearchItems(searchText: searchText)
        }
    }
//    func reset() {
//        searchData = nil
//        search.removeAll()
//    }
}
