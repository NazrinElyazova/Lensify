//
//  FavoriteUseCase.swift
//  Lensify
//
//  Created by Nazrin on 06.03.24.
//

import Foundation

protocol FavoriteUseCase {
    func getPhotoDetail(completion: @escaping(([TopicElement]?, String?)-> Void))
}
