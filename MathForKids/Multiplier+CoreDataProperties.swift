//
//  Multiplier+CoreDataProperties.swift
//  MathForKids
//
//  Created by Abhimanyu Rathore on 04/08/21.
//  Copyright © 2021 Smriti. All rights reserved.
//
//

import Foundation
import CoreData


extension Multiplier {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Multiplier> {
        return NSFetchRequest<Multiplier>(entityName: "Multiplier")
    }

    @NSManaged public var levels: NSSet?

}

// MARK: Generated accessors for levels
extension Multiplier {

    @objc(addLevelsObject:)
    @NSManaged public func addToLevels(_ value: Level)

    @objc(removeLevelsObject:)
    @NSManaged public func removeFromLevels(_ value: Level)

    @objc(addLevels:)
    @NSManaged public func addToLevels(_ values: NSSet)

    @objc(removeLevels:)
    @NSManaged public func removeFromLevels(_ values: NSSet)

}

extension Multiplier : Identifiable {

}
