//
//  ListPhotoUseCase.swift
//  Lensify
//
//  Created by Nazrin on 06.02.24.
//

import Foundation

protocol ListPhotoUseCase {
    func getListPhotos(completion: @escaping(([List]?, String?)-> Void))
}
