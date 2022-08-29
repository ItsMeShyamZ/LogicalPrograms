//
//  Teacher+CoreDataProperties.swift
//  RelationalCoreData
//
//  Created by Shyamala's MacBook Pro on 13/08/22.
//
//

import Foundation
import CoreData


extension Teacher {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Teacher> {
        return NSFetchRequest<Teacher>(entityName: "Teacher")
    }

    @NSManaged public var name: String?
    @NSManaged public var classRep: String?
    @NSManaged public var mainSub: String?
    @NSManaged public var tech: NSSet?

}

// MARK: Generated accessors for tech
extension Teacher {

    @objc(addTechObject:)
    @NSManaged public func addToTech(_ value: Class)

    @objc(removeTechObject:)
    @NSManaged public func removeFromTech(_ value: Class)

    @objc(addTech:)
    @NSManaged public func addToTech(_ values: NSSet)

    @objc(removeTech:)
    @NSManaged public func removeFromTech(_ values: NSSet)

}

extension Teacher : Identifiable {

}
