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
//                self.searchData = data
//                self.search = data.results ?? []
                self.search += newResults
                self.onSucces?()
                //                print(data)
            }
        }
    }
    func pagination(searchText: String) {
        let limit = 10
        getSearchItems(searchText: searchText, limit: limit)
    }
//    func pagination(index: Int, searchText: String) {
////        // Calculate the current page based on the number of items and items per page
//        
//        //MARK: Current page < Total Page
//        let currentPage = (search.count / 10) + 1
////        let total = searchData?.total
////        let totalPages = searchData?.totalPages
////        let currentPage = ("\(total / totalPages)")
////        var page = Int()
//        if index == search.count-1 && currentPage <= searchData?.totalPages ?? 0 {
//          print("+++++++++++++")
//            getSearchItems(searchText: searchText)
//        }
//    }
//    func reset() {
//        searchData = nil
//        search.removeAll()
//    }
}
