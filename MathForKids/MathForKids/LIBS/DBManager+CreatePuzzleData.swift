//
//  DBManager+CreatePuzzleData.swift
//  MathForKids
//
//  Created by Abhimanyu Rathore on 04/08/21.
//  Copyright © 2021 Smriti. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension DBManager {
    
   
    func getOperatorManagerForUser()->OperatorManager{
        
        let entityOperatorManager = NSEntityDescription.entity(forEntityName: "OperatorManager", in: managedContext ?? NSManagedObjectContext() )!
        let operatorManagerObj  = NSManagedObject(entity: entityOperatorManager, insertInto: managedContext) as! OperatorManager
        
        operatorManagerObj.addition = self.getAdditionData()
        operatorManagerObj.division = self.getDivisionData()
        operatorManagerObj.multiplier = self.getMultiplicationData()
        operatorManagerObj.subtraction = self.getSubstractionData()
        return operatorManagerObj
    }

    
    func getAdditionData()->Addition {
        //create Addition Data (20 Levels (each level have 20 questions))
        let entityAddition = NSEntityDescription.entity(forEntityName: "Addition", in: managedContext! )!
        let addition = NSManagedObject(entity: entityAddition, insertInto: managedContext) as! Addition
        
        if let levels = Operator.shared.addition.levels {
            for level in levels {
                let levelEntity = NSEntityDescription.entity(forEntityName: "Level", in: managedContext! )!
                let levelCoreData = NSManagedObject(entity: levelEntity, insertInto: managedContext) as! Level
                
                levelCoreData.setValue(level.isUnlocked, forKeyPath: "isUnlocked")
                levelCoreData.setValue(level.score, forKeyPath: "score")
                levelCoreData.setValue(level.timeInterval, forKeyPath: "timeInterval")
                levelCoreData.setValue(level.levelName, forKeyPath: "title")
                
                //20 questions
                for qsn in level.listOfQuestions  {
                  
                   let questionEntity = NSEntityDescription.entity(forEntityName: "QuestionModel", in: managedContext!)!
                   let questionCoreData = NSManagedObject(entity: questionEntity, insertInto: managedContext) as! QuestionModel
               
                    questionCoreData.setValue(qsn.questionTitle, forKeyPath: "questionTitle")
                    questionCoreData.setValue(qsn.result, forKeyPath: "result")
                    questionCoreData.setValue(qsn.x, forKeyPath: "x")
                    questionCoreData.setValue(qsn.y, forKeyPath: "y")
                    
                    //finally load each question on level
                    levelCoreData.addToQuestions(questionCoreData)
               }
                //finally load each level
                addition.addToLevels(levelCoreData)
            }
        }
        return addition
    }
    
    
    
    func getMultiplicationData()->Multiplier {
        //create Multiplier Data (20 Levels (each level have 20 questions))
        let entityMult = NSEntityDescription.entity(forEntityName: "Multiplier", in: managedContext! )!
        let multiplier = NSManagedObject(entity: entityMult, insertInto: managedContext) as! Multiplier
        
        if let levels = Operator.shared.multiplication.levels {
            for level in levels {
                let levelEntity = NSEntityDescription.entity(forEntityName: "Level", in: managedContext!)!
                let levelCoreData = NSManagedObject(entity: levelEntity, insertInto: managedContext) as! Level
                
                levelCoreData.setValue(level.isUnlocked, forKeyPath: "isUnlocked")
                levelCoreData.setValue(level.score, forKeyPath: "score")
                levelCoreData.setValue(level.timeInterval, forKeyPath: "timeInterval")
                levelCoreData.setValue(level.levelName, forKeyPath: "title")
                
                //20 questions
                for qsn in level.listOfQuestions  {
                  
                   let questionEntity = NSEntityDescription.entity(forEntityName: "QuestionModel", in: managedContext ?? NSManagedObjectContext() )!
                   let questionCoreData = NSManagedObject(entity: questionEntity, insertInto: managedContext) as! QuestionModel
               
                    questionCoreData.setValue(qsn.questionTitle, forKeyPath: "questionTitle")
                    questionCoreData.setValue(qsn.result, forKeyPath: "result")
                    questionCoreData.setValue(qsn.x, forKeyPath: "x")
                    questionCoreData.setValue(qsn.y, forKeyPath: "y")
                    
                    //finally load each question on level
                    levelCoreData.addToQuestions(questionCoreData)
               }
                //finally load each level
                multiplier.addToLevels(levelCoreData)
            }
        }
        return multiplier
    }
    
    
    
    func getDivisionData()->Division {
        //create Division Data (20 Levels (each level have 20 questions))
        let entityDivision = NSEntityDescription.entity(forEntityName: "Division", in: managedContext!)!
        let div = NSManagedObject(entity: entityDivision, insertInto: managedContext) as! Division
        
        if let levels = Operator.shared.division.levels {
            for level in levels {
                let levelEntity = NSEntityDescription.entity(forEntityName: "Level", in: managedContext!)!
                let levelCoreData = NSManagedObject(entity: levelEntity, insertInto: managedContext) as! Level
                
                levelCoreData.setValue(level.isUnlocked, forKeyPath: "isUnlocked")
                levelCoreData.setValue(level.score, forKeyPath: "score")
                levelCoreData.setValue(level.timeInterval, forKeyPath: "timeInterval")
                levelCoreData.setValue(level.levelName, forKeyPath: "title")
                
                //20 questions
                for qsn in level.listOfQuestions  {
                  
                   let questionEntity = NSEntityDescription.entity(forEntityName: "QuestionModel", in: managedContext!)!
                   let questionCoreData = NSManagedObject(entity: questionEntity, insertInto: managedContext) as! QuestionModel
               
                    questionCoreData.setValue(qsn.questionTitle, forKeyPath: "questionTitle")
                    questionCoreData.setValue(qsn.result, forKeyPath: "result")
                    questionCoreData.setValue(qsn.x, forKeyPath: "x")
                    questionCoreData.setValue(qsn.y, forKeyPath: "y")
                    
                    //finally load each question on level
                    levelCoreData.addToQuestions(questionCoreData)
               }
                //finally load each level
                div.addToLevels(levelCoreData)
            }
        }
        return div
    }
    
    
    
    
    func getSubstractionData()->Subtraction {
        //create Subtraction Data (20 Levels (each level have 20 questions))
        let entitySubtraction = NSEntityDescription.entity(forEntityName: "Subtraction", in: managedContext!)!
        let subtraction = NSManagedObject(entity: entitySubtraction, insertInto: managedContext) as! Subtraction
        
        if let levels = Operator.shared.subtraction.levels {
            for level in levels {
                let levelEntity = NSEntityDescription.entity(forEntityName: "Level", in: managedContext! )!
                let levelCoreData = NSManagedObject(entity: levelEntity, insertInto: managedContext) as! Level
                
                levelCoreData.setValue(level.isUnlocked, forKeyPath: "isUnlocked")
                levelCoreData.setValue(level.score, forKeyPath: "score")
                levelCoreData.setValue(level.timeInterval, forKeyPath: "timeInterval")
                levelCoreData.setValue(level.levelName, forKeyPath: "title")
                
                //20 questions
                for qsn in level.listOfQuestions  {
                  
                   let questionEntity = NSEntityDescription.entity(forEntityName: "QuestionModel", in: managedContext!)!
                   let questionCoreData = NSManagedObject(entity: questionEntity, insertInto: managedContext) as! QuestionModel
               
                    questionCoreData.setValue(qsn.questionTitle, forKeyPath: "questionTitle")
                    questionCoreData.setValue(qsn.result, forKeyPath: "result")
                    questionCoreData.setValue(qsn.x, forKeyPath: "x")
                    questionCoreData.setValue(qsn.y, forKeyPath: "y")
                    
                    //finally load each question on level
                    levelCoreData.addToQuestions(questionCoreData)
               }
                //finally load each level
                subtraction.addToLevels(levelCoreData)
            }
        }
        return subtraction
    }

}
