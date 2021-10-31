//
//  Question.swift
//  MathForKids
//
//  Copyright © 2020 Smriti. All rights reserved.


import Foundation

class LevelQuestion {
   
     var  questionTitle:String
     var  x:Int
     var  y:Int
     var  result :Int? 

    
    init(questionTitle:String = "Q1" ,x:Int = 5, y:Int = 5,result:Int? = nil ) {
        self.x = x
        self.y = y
        self.questionTitle = questionTitle
        self.result = result
    }

}




