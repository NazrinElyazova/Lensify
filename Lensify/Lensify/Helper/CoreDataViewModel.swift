////
////  CoreDataViewModel.swift
////  Lensify
////
////  Created by Nazrin on 04.03.24.
////
//
//import Foundation
//
//class CoreDataViewModel {
//    var items = [FavPhoto]()
//    
//    let context = AppDelegate().persistentContainer.viewContext
//    
//    var completion: (()->Void)?
//    
//    func fetchData() {
//        CoreDataManager.shared.fetchItems()
//        CoreDataManager.shared.completion = {
//            items in
//            self.items = items
//            self.completion?()
//        }
//    }
//    func saveData(image: Data) {
//        do {
//            let model = FavPhoto(context: context)
//            model.image = image
//            try context.save()
//            fetchData()
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//    func deleteData(index: Int) {
//        do {
//            context.delete(items[index])
//            try context.save()
//            fetchData()
//        }
//        catch {
//            print(error.localizedDescription)
//        }
//    }
//}
