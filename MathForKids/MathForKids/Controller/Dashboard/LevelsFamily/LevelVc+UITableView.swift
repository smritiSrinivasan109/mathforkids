//
//  LevelVc+UITableView.swift
//  MathForKids
//
//  Created by Abhimanyu Rathore on 27/06/21.
//  Copyright © 2021 Smriti. All rights reserved.
//

import Foundation
import UIKit

extension LevelsVc : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch Operator.shared.selectedOperatorType! {
        case .addition:return user!.operatorManager!.addition!.levels!.count
        case .multiplication:return  user!.operatorManager!.multiplier!.levels!.count
        case .subtraction:return user!.operatorManager!.subtraction!.levels!.count
        case .division:return  user!.operatorManager!.division!.levels!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellConstants.levelCellIdentifier, for: indexPath) as! LevelCell
        
        switch Operator.shared.selectedOperatorType! {
        case .addition:
            cell.lblLevel.text      =   "Level \( additionLevels[indexPath.row].title!)"
            cell.lblScore.text      =    "You Scored :\(additionLevels[indexPath.row].score)"
            
        case .multiplication:
            cell.lblLevel.text      =    "Level \( multLevels[indexPath.row].title!)"
            cell.lblScore.text      =    "You Scored :\(multLevels[indexPath.row].score)"
        case .subtraction:
            cell.lblLevel.text      =    "Level \( subtractionLevels[indexPath.row].title!)"
            cell.lblScore.text      =    "You Scored :\(subtractionLevels[indexPath.row].score)"
        case .division:
            cell.lblLevel.text      =        "Level \( divideLevels[indexPath.row].title!)"
            cell.lblScore.text      =    "You Scored :\(divideLevels[indexPath.row].score)"
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("table cell clicked buy user :- \(indexPath.row)")
        
        let vcQuestion =  CommonUtils.getVcObject(storyboardName:"Home" , vcIdentifier: "QuestionsVc") as! QuestionsVc
        
        switch Operator.shared.selectedOperatorType! {
        case .addition:vcQuestion.level = additionLevels[indexPath.row]
        case .multiplication: vcQuestion.level = multLevels[indexPath.row]
        case .subtraction:vcQuestion.level = subtractionLevels[indexPath.row]
        case .division:vcQuestion.level = divideLevels[indexPath.row]
            
        }
        self.navigationController?.pushViewController(vcQuestion, animated: true)
        
    }
    
    
    
    
    
}
