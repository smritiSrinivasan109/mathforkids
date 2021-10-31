//
//  UserDefault.swift
//  MathForKids
//
//  Copyright © 2021 Smriti. All rights reserved.
//

import Foundation


let emailKey:String = "email"
let passwordKey:String = "password"


class UserDefault {
    
    //1
    static func saveInUserCredentials(email:String,password:String) {
      UserDefaults.standard.set(email, forKey: emailKey)
      UserDefaults.standard.set(password, forKey: passwordKey)
    }
    
    //2
    static func getCurrentUserCredentials()-> (email: String?,password:String?) {
        if let email = UserDefaults.standard.object(forKey: emailKey) as? String ,
           let password = UserDefaults.standard.object(forKey: passwordKey) as? String {
            return (email,password)
        }
       return (nil,nil)
    }
    
    //3
    static func removeUserCredentials() {
      UserDefaults.standard.removeObject(forKey: emailKey)
      UserDefaults.standard.removeObject(forKey: passwordKey)
      applicationDelegate?.decideRouteOnBasisOfUser()
    }
    
    //4 compare current user credentials with list of DB users (if any user have same credentials then show home screen)
    static func userExistInDataBase(emailAddrees:String?,pass:String?) -> User? {
        //get list of all users
       let users =  DBManager.shared.fetchSavedUsers()
        for user in users {
            if let email =  user.email ,
               let password = user.password{
                //compare each user
                if emailAddrees == email && pass == password{
                    return user
                }
            }
        }
        return nil
    }

}


