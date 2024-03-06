//
//  FavoriteUseCase.swift
//  Lensify
//
//  Created by Nazrin on 06.03.24.
//

import Foundation

protocol FavoriteUseCase {
    func getPhotoDetail(photoID: String?, completion: @escaping(([GetTopics]?, String?)-> Void))
}
