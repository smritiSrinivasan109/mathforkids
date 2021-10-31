//
//  OperatorManager.swift
//  MathForKids
//
//  Created by ASR on 02/01/21.
//  Copyright © 2021 Smriti. All rights reserved.
//

import Foundation


enum SelectedOperatortype {
    case addition
    case subtraction
    case division
    case multiplication
}


class Operator {
    
    static  let shared:Operator = Operator()
    
    var selectedOperatorType:SelectedOperatortype?
    
    
    //restrict any other ot create second object in heap because it is single tone.
    private init() {}
    
    private(set) var addition:AdditionOperator = AdditionOperator()
    private(set) var subtraction:SubtractionOperator = SubtractionOperator()
    private(set)  var division:DivisionOperator = DivisionOperator()
    private(set) var multiplication:MultiplicationOperator =  MultiplicationOperator()
    
}
