//
//  Subtraction+CoreDataProperties.swift
//  MathForKids
//
//  Created by Abhimanyu Rathore on 13/06/21.
//  Copyright © 2021 Smriti. All rights reserved.
//
//

import Foundation
import CoreData


extension Subtraction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Subtraction> {
        return NSFetchRequest<Subtraction>(entityName: "Subtraction")
    }

    @NSManaged public var levels: NSSet?

}

// MARK: Generated accessors for levels
extension Subtraction {

    @objc(addLevelsObject:)
    @NSManaged public func addToLevels(_ value: Level)

    @objc(removeLevelsObject:)
    @NSManaged public func removeFromLevels(_ value: Level)

    @objc(addLevels:)
    @NSManaged public func addToLevels(_ values: NSSet)

    @objc(removeLevels:)
    @NSManaged public func removeFromLevels(_ values: NSSet)

}

extension Subtraction : Identifiable {

}
