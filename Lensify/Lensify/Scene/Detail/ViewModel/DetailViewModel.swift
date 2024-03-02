//
//  DetailViewModel.swift
//  Lensify
//
//  Created by Nazrin on 02.03.24.
//

import Foundation

//class DetailViewModel {
//    var detail = [TopicElement]()
//    
//    private let manager = HomeManager()
//    
//    var onSuccess: (()-> Void)?
//    var onError: ((String)-> Void)?
//    
//    var id: String
//    
//    init(movieId: String) {
//        self.id = movieId
//    }
//    
//    func getDetailPhoto() {
//        manager.getHomeList(pageNumber: <#T##Int#>, id: <#T##String#>, completion: <#T##([GetTopics]?, String?) -> Void#>)(id: id) { data, errorMessage in
//            if let errorMessage {
//                self.onError?(errorMessage)
//            } else if let data {
////                self.topicItems = data
////                self.topicId = data.first?.id
//                self.detail = data
//                self.onSuccess?()
//            }
//        }
//    }
//}
