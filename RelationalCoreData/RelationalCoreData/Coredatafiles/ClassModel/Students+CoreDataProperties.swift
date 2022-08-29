//
//  Students+CoreDataProperties.swift
//  RelationalCoreData
//
//  Created by Shyamala's MacBook Pro on 13/08/22.
//
//

import Foundation
import CoreData


extension Students {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Students> {
        return NSFetchRequest<Students>(entityName: "Students")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var classs: Class?

}

extension Students : Identifiable {

}
