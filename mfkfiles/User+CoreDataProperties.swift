//
//  User+CoreDataProperties.swift
//  MathForKids
//
//  Created by Abhimanyu Rathore on 13/06/21.
//  Copyright © 2021 Smriti. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var image: Data?
    @NSManaged public var lastName: String?
    @NSManaged public var password: String?
    @NSManaged public var operatorManager: OperatorManager?

}

extension User : Identifiable {

}
