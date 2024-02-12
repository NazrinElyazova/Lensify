//
//  SearchUseCase.swift
//  Lensify
//
//  Created by Nazrin on 31.01.24.
//

import Foundation
protocol SearchUseCase {
    func getSearchItems (limit: Int, pageNumber: Int, searchText: String, completion: @escaping((Search?, String?)-> Void))
}
