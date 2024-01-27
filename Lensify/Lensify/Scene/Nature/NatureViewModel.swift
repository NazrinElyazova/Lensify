//
//  NatureViewModel.swift
//  Lensify
//
//  Created by Nazrin on 15.01.24.
//

import Foundation

class NatureViewModel {
    var nature = [Photo]()
    
    var onSuccess: (()->Void)?
    var onError: ((String)-> Void)?
    
    let manager = NatureManager()
    
    func getNature() {
        manager.getNatureList(endpoint: NatureEndpoint.nature)
        { data, errorMessage in
            if let errorMessage = errorMessage {
                self.onError?(errorMessage)
            } else if let data = data {
                self.nature = data
                self.onSuccess?()
            }
        }
    }
}
