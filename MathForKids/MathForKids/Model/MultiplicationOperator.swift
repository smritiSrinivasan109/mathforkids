//
//  Multiplication.swift
//  MathForKids
//
//  Created by temp account on 02/01/21.
//  Copyright © 2021 Smriti. All rights reserved.
//

import Foundation
class MultiplicationOperator {
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
            
            //do stuff here
            let question:LevelQuestion = LevelQuestion.init(questionTitle: String(level+1),
                                                            x: Int.random(in: range) ,
                                                            y: Int.random(in: range))
            qsns.append(question)
        }
        return qsns
    }

}
