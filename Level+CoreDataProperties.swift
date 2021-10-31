//
//  Level+CoreDataProperties.swift
//  MathForKids
//
//  Created by Abhimanyu Rathore on 07/08/21.
//  Copyright © 2021 Smriti. All rights reserved.
//
//

import Foundation
import CoreData


extension Level {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Level> {
        return NSFetchRequest<Level>(entityName: "Level")
    }

    @NSManaged public var isUnlocked: Bool
    @NSManaged public var score: Int64
    @NSManaged public var timeInterval: Double
    @NSManaged public var title: String?
    @NSManaged public var questions: NSSet?

}

// MARK: Generated accessors for questions
extension Level {

    @objc(addQuestionsObject:)
    @NSManaged public func addToQuestions(_ value: QuestionModel)

    @objc(removeQuestionsObject:)
    @NSManaged public func removeFromQuestions(_ value: QuestionModel)

    @objc(addQuestions:)
    @NSManaged public func addToQuestions(_ values: NSSet)

    @objc(removeQuestions:)
    @NSManaged public func removeFromQuestions(_ values: NSSet)

}

extension Level : Identifiable {

}
