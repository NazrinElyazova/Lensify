//
//  FavPhoto+CoreDataProperties.swift
//  Lensify
//
//  Created by Nazrin on 04.03.24.
//
//

import Foundation
import CoreData


extension FavPhoto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavPhoto> {
        return NSFetchRequest<FavPhoto>(entityName: "FavPhoto")
    }

    @NSManaged public var image: String?

}

extension FavPhoto : Identifiable {

}
