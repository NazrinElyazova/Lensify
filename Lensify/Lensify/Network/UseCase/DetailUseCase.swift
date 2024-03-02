//
//  DetailUseCase.swift
//  Lensify
//
//  Created by Nazrin on 02.03.24.
//

import Foundation

protocol DetailUseCase {
    func getPhotoDetail(endpoint: HomeEndpoint, photoID: Int?, completion: @escaping(([TopicElement]?, String?)-> Void))
}
