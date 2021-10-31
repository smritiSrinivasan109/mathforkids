//
//  QuestionsVc+GameCalculation.swift
//  MathForKids
//
//  Created by Abhimanyu Rathore on 08/08/21.
//  Copyright © 2021 Smriti. All rights reserved.
//

import Foundation

extension QuestionsVc {
    
    //MARK:- Call this when Timer will reach on the last limit of time / Submit button click
    func submitAnswersAndUpdateScore()->Int64{
        var correctAnswers:[Bool] = [Bool]()
        //17 questions are 85%
        if resultList.isEmpty || resultList.count < 17  {
            CommonUtils.showAlertWithOkay(vc: self, title: appName, message: "You did not completed game!, Sorry!") {
                self.navigationController?.popViewController(animated: true)
            }
        }else {
            //calculate score here for all question and decide score
        
            for i  in 0 ..< resultList.count {
                let userInput  = resultList[i]
                var correctAnswer:Int64 = 0
                switch Operator.shared.selectedOperatorType! {
                case .addition:
                    
                    correctAnswer = questions[i].x + questions[i].y
                    print("correct answer of \(questions[i].x) +  \(questions[i].y) = \(correctAnswer)")
                    print("User Input \(userInput)")
                    questions[i].result = userInput
                    

                case .multiplication:
                    correctAnswer = questions[i].x * questions[i].y
                    
                    print("correct answer of \(questions[i].x) *  \(questions[i].y) = \(correctAnswer)")
                    print("User Input \(userInput)")
                    questions[i].result = userInput
                    

                case .subtraction:
                    correctAnswer = questions[i].x - questions[i].y
                    print("correct answer of \(questions[i].x) -  \(questions[i].y) = \(correctAnswer)")
                    print("User Input \(userInput)")
              
                case .division:
                    correctAnswer = questions[i].x / questions[i].y
                    print("correct answer of \(questions[i].x)  / \(questions[i].y) = \(correctAnswer)")
                    print("User Input \(userInput)")
                    questions[i].result = userInput
                }
                
                if correctAnswer == userInput {
                    print("\(correctAnswer) == \(userInput)")
                    questions[i].isCorrect = true
                    correctAnswers.append(true)
                }else{
                    questions[i].isCorrect = false
                }
                //saving in to data base proprly
                applicationDelegate?.saveContext()
            }
            
           
            //now this is the to update level score (how much user got)
          
            level!.score = getScore(correctAnswers: correctAnswers)
            
            //saving in to data base proprly
            applicationDelegate?.saveContext()
        }
    
        return getScore(correctAnswers: correctAnswers)

    }
    
    func getScore(correctAnswers:[Bool])->Int64 {
        //formula of scoring
        let result:Double = (Double(correctAnswers.count) / Double(20))
        return Int64(result * 100)
    }
    
    
    
    
    
    
    
}
