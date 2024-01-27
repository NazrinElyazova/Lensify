//
//  HomeUseCse.swift
//  Lensify
//
//  Created by Nazrin on 20.01.24.
//

import Foundation
protocol HomeUseCase {
    func getTopics(completion: @escaping(([TopicElement]?, String?)->Void))
    func getHomeList(id: String, endpoint: HomeEndpoint, completion: @escaping(([Wallpapers]?, String?)->Void))
}
