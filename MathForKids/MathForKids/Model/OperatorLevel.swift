//
//  Level.swift
//  MathForKids
//  Copyright © 2020 Smriti. All rights reserved.


import Foundation

class OperatorLevel {
   
    var  listOfQuestions:[LevelQuestion]
    var  score:Int
    var  timeInterval:Double
    var  isUnlocked:Bool = false
    var level:Int
    var levelName:String
    
    init(listOfQuestions:[LevelQuestion]
            ,score:Int = 0,
                timeInterval:Double = 15,//minute
                isUnlocked:Bool = false,level:Int,levelName:String) {
        self.listOfQuestions = listOfQuestions
        self.score = score
        self.timeInterval = timeInterval
        self.isUnlocked = isUnlocked
        self.level = level
        self.levelName = levelName
    }
    
    
    
}
