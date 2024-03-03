//
//  DetailUseCase.swift
//  Lensify
//
//  Created by Nazrin on 02.03.24.
//

import Foundation

protocol DetailUseCase {
    func getPhotoDetail(photoID: String?, completion: @escaping(([TopicElement]?, String?)-> Void))
}
