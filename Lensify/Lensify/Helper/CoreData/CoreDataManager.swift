//
//  CoreDataManager.swift
//  Lensify
//
//  Created by Nazrin on 19.03.24.
//

import Foundation
import UIKit

class CoreDataManager {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var success: (([Detail]) -> Void)?
    var items: [Detail]?
    
    func fetchImage() {
        do {
            let items = try context.fetch(Detail.fetchRequest())
            self.items = items
            DispatchQueue.main.async {
                self.success?(items)
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteAction() {
        do {
            try self.context.save()
        }
        catch {
            print(error.localizedDescription)
        }
        self.fetchImage()
    }
}


