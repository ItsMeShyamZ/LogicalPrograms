//
//  Class+CoreDataProperties.swift
//  RelationalCoreData
//
//  Created by Shyamala's MacBook Pro on 13/08/22.
//
//

import Foundation
import CoreData


extension Class {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Class> {
        return NSFetchRequest<Class>(entityName: "Class")
    }

    @NSManaged public var name: String?
    @NSManaged public var classTeacher: String?
    @NSManaged public var section: String?
    @NSManaged public var student: NSSet?
    @NSManaged public var tech: NSSet?

}

// MARK: Generated accessors for student
extension Class {

    @objc(addStudentObject:)
    @NSManaged public func addToStudent(_ value: Students)

    @objc(removeStudentObject:)
    @NSManaged public func removeFromStudent(_ value: Students)

    @objc(addStudent:)
    @NSManaged public func addToStudent(_ values: NSSet)

    @objc(removeStudent:)
    @NSManaged public func removeFromStudent(_ values: NSSet)

}

// MARK: Generated accessors for tech
extension Class {

    @objc(addTechObject:)
    @NSManaged public func addToTech(_ value: Teacher)

    @objc(removeTechObject:)
    @NSManaged public func removeFromTech(_ value: Teacher)

    @objc(addTech:)
    @NSManaged public func addToTech(_ values: NSSet)

    @objc(removeTech:)
    @NSManaged public func removeFromTech(_ values: NSSet)

}

extension Class : Identifiable {

}
