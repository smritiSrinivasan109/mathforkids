//
//  OperatorManager+CoreDataProperties.swift
//  MathForKids
//
//  Created by Abhimanyu Rathore on 13/06/21.
//  Copyright © 2021 Smriti. All rights reserved.
//
//

import Foundation
import CoreData


extension OperatorManager {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OperatorManager> {
        return NSFetchRequest<OperatorManager>(entityName: "OperatorManager")
    }

    @NSManaged public var addition: Addition?
    @NSManaged public var division: Division?
    @NSManaged public var multiplier: Multiplier?
    @NSManaged public var subtraction: Subtraction?

}

extension OperatorManager : Identifiable {

}
