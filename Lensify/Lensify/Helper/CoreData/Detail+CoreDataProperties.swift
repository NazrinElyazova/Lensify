//
//  Detail+CoreDataProperties.swift
//  Lensify
//
//  Created by Nazrin on 18.03.24.
//
//

import Foundation
import CoreData


extension Detail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Detail> {
        return NSFetchRequest<Detail>(entityName: "Detail")
    }

    @NSManaged public var detailPhoto: Data?

}

extension Detail : Identifiable {

}
