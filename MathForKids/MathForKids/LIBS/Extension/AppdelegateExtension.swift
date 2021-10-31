//
//  AppdelegateExtension.swift
//  MathForKids
//

//  Copyright © 2021 Smriti. All rights reserved.
//

import Foundation
import UIKit
import CoreData
extension AppDelegate {
    
    func decideRouteOnBasisOfUser(){
       
        if let user = UserDefault.userExistInDataBase(emailAddrees:  UserDefault.getCurrentUserCredentials().email, pass:  UserDefault.getCurrentUserCredentials().password) {
            //go to home
            let vcHome =  CommonUtils.getVcObject(storyboardName:"Home" , vcIdentifier: "HomeVc") as! HomeVc
            vcHome.user = user
            navController = UINavigationController.init(rootViewController: vcHome)
            
//            //check the user , it is loaded with all skelton or not
//            print(user.email)
//            print(user.firstName)
//            print(user.lastName)
//            
//            if let operatorManager = user.operatorManager {
//                print(operatorManager)
//                
//                
//                if let addition = operatorManager.addition {
//                    if let levels  =  addition.levels  {
//                        print("addition")
//                        print(levels.count)
//                    }
//                }
//                
//                if let division = operatorManager.division {
//                    if let levels  =  division.levels  {
//                        print("division")
//                        print(levels.count)
//                    }
//                }
//                
//                if let multiplier = operatorManager.multiplier {
//                    if let levels  =  multiplier.levels  {
//                        print("multiplier")
//                        print(levels.count)
//                    }
//                }
//                
//                
//                if let subtraction = operatorManager.subtraction {
//                    if let levels  =  subtraction.levels  {
//                        print("subtraction")
//                        print(levels.count)
//                        
//                    }
//                }
//                
//            }
//            print(user.operatorManager)
//            print(user.email)
            
            
        }else{
            //user is nil , so go to login
            let vcLogin =  CommonUtils.getVcObject(storyboardName:"LoginSignup" , vcIdentifier: "LoginVc") as! LoginVc
            navController = UINavigationController.init(rootViewController: vcLogin)
        }
        
         self.window = UIWindow.init(frame: CGRect.init(x: 0, y: 0, width:screenWidth , height: screenHeight))
         self.window?.backgroundColor = .yellow
         self.window?.rootViewController =  navController
         self.window?.makeKeyAndVisible()
    }
}
