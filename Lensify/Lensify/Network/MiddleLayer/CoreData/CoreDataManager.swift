////
////  CoreDataManager.swift
////  Lensify
////
////  Created by Nazrin on 04.03.24.
////
//
//import Foundation
//
//class CoreDataManager {
//    static let shared = CoreDataManager()
//    
//    var completion: (([FavPhoto]) -> Void)?
//    
//    let context = AppDelegate().persistentContainer.viewContext
//    
//    func fetchItems() {
//        do {
//            let items = try context.fetch(FavPhoto.fetchRequest())
//            completion?(items)
//        }
//        catch {
//            print(error.localizedDescription)
//        }
//    }
//    
//}
