//
//  QuestionModel+CoreDataProperties.swift
//  MathForKids
//
//  Created by Abhimanyu Rathore on 08/08/21.
//  Copyright © 2021 Smriti. All rights reserved.
//
//

import Foundation
import CoreData


extension QuestionModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuestionModel> {
        return NSFetchRequest<QuestionModel>(entityName: "QuestionModel")
    }

    @NSManaged public var questionTitle: String?
    @NSManaged public var result: Int64
    @NSManaged public var x: Int64
    @NSManaged public var y: Int64
    @NSManaged public var isCorrect: Bool

}

extension QuestionModel : Identifiable {

}
