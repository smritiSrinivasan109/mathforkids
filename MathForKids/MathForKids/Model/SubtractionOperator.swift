//
//  Subtraction.swift
//  MathForKids
//
//  Created by temp account on 02/01/21.
//  Copyright © 2021 Smriti. All rights reserved.
//

import Foundation
class SubtractionOperator {
    //Decide levels
    let levelCount = 20

    let numberOFQuestionsCount = 20
    
    public lazy  var levels : [OperatorLevel]? = {
       var levels = [OperatorLevel]()
        //create level
        for i  in 0 ..< levelCount  {
            var level = OperatorLevel(listOfQuestions: createQuestionForLevel(level: i), level: i,levelName: "\(i+1)")
            if i == 0 {
                level.isUnlocked = true
            }
            levels.append(level)
        }
       return levels
    }()
    
    

    init() { }
    
    //MARK:- Create Questions
    func createQuestionForLevel(level:Int)-> [LevelQuestion]{
        
        let range:Range<Int>! = level < 10 ? Range.init(0...9) : Range.init(10...99)
        
        
        var qsns:[LevelQuestion] = [LevelQuestion]()
        
        
        
        
        for _ in 0 ..< numberOFQuestionsCount {
            
            //logic for giving always x value greater than y for kids in substraction
            let value1 = Int.random(in: range)
            let value2 = Int.random(in: range)
            var x:Int = 0
            var y:Int = 0
            
            if value1 > value2 {
                x = value1
                y = value2
            } else if value1 < value2 {
                x = value2
                y = value1
            }else{
                x = value1
                y = value2
            }
            let question:LevelQuestion = LevelQuestion.init(questionTitle: String(level+1),
                                                            x: x ,
                                                            y: y)
            qsns.append(question)
        }
        
        return qsns
    }

}
