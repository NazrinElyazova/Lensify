//
//  NatureUseCase.swift
//  Lensify
//
//  Created by Nazrin on 27.01.24.
//

import Foundation
protocol NatureUseCase {
    func getNatureList(endpoint: NatureEndpoint, completion: @escaping (([Photo]?, String?)->Void))
}
