//
//  Division.swift
//  MathForKids
//
//  Created by temp account on 02/01/21.
//  Copyright © 2021 Smriti. All rights reserved.
//

import Foundation
class DivisionOperator {
    
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
        var dividers:[Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
        var dividents:[Int] = [Int]()
        for i in 1 ..< 99 {
            dividents.append(i)
        }
        let range:Range<Int>! = level < 10 ? Range.init(1...9) : Range.init(10...99)
        var qsns:[LevelQuestion] = [LevelQuestion]()
        for i in 0 ..< numberOFQuestionsCount {
            dividers.shuffle()
            dividents.shuffle()
            //logic for giving always x value greater than y for kids in Division
            let divider = dividers[i]
            var divident:Int = 0
            for number in dividents {
                if  number % divider == 0  {
                    divident = number
                    break
                }
            }
           
            let question:LevelQuestion = LevelQuestion.init(questionTitle: String(level+1),
                                                            x: divident ,
                                                            y: divider)
            qsns.append(question)
        }
        return qsns
    }

   
}
