//
//  SearchUseCase.swift
//  Lensify
//
//  Created by Nazrin on 31.01.24.
//

import Foundation
protocol SearchUseCase {
    func getSearchItems(completion: @escaping(()-> Void))
}
