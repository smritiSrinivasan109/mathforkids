//
//  DataBaseManger.swift
//  MathForKids

//  Copyright © 2021 Smriti. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DBManager {

    //single tone object
    static var shared:DBManager = DBManager()

    // 1
    let managedContext = applicationDelegate?.persistentContainer.viewContext
    
    func saveUser(signUpModel:SignUpModel){
      
        // 2
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext ?? NSManagedObjectContext() )!
        
        let user = NSManagedObject(entity: entity, insertInto: managedContext) as! User
        
        // 3
      
        user.setValue((signUpModel.firstName ?? ""), forKeyPath: "firstName")
        user.setValue((signUpModel.lastName ?? ""), forKeyPath: "lastName")
        
        //credentioals (by them you can compare and take dicision   of  navigation of user(login / Home) )
        user.setValue((signUpModel.email ?? ""), forKeyPath: "email")
        user.setValue((signUpModel.password ?? ""), forKeyPath: "password")
    
        //CREATE  DATA FOR ENTIRE GAME
        user.operatorManager =  getOperatorManagerForUser()
        
        // 4
        do {
            try managedContext?.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

    func fetchSavedUsers()->[User]{
        var records:[User]!
        let managedContext = applicationDelegate?.persistentContainer.viewContext
        // Create Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        // Add Sort Descriptor
        let sortDescriptor = NSSortDescriptor(key: "email", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            records = try managedContext?.fetch(fetchRequest) as! [User]
            print(records)

        } catch {
            print(error)
        }
        return records
    }

   
    func removeUser(user:User){

        let managedContext = applicationDelegate?.persistentContainer.viewContext
        managedContext?.delete(user)
        
        do {
            try managedContext?.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

