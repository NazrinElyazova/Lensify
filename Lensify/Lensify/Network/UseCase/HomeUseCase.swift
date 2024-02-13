//
//  HomeUseCase.swift
//  Lensify
//
//  Created by Nazrin on 20.01.24.
//

import Foundation

protocol HomeUseCase {
    
    func getTopics(completion: @escaping(([TopicElement]?, String?)->Void))
    
    func getHomeList(pageNumber: Int, limit: Int, id: String, completion: @escaping(([GetTopics]?, String?)->Void))
}
