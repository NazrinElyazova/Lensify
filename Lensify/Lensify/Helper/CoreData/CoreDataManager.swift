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
    
    static let shared = CoreDataManager()
    
    private init() {}

    func fetchImage(success:  (([Detail]) -> Void)?) {
        do {
            let items = try context.fetch(Detail.fetchRequest())
            DispatchQueue.main.async { [weak self] in
                guard let _ = self else { return }
                success?(items)
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteAction(id: Detail, success:  (([Detail]) -> Void)?) {
        context.delete(id)

        do {
            try context.save()
        }
        catch {
            print(error.localizedDescription)
        }
        fetchImage { items in
            success?(items)
        }
    }
}


