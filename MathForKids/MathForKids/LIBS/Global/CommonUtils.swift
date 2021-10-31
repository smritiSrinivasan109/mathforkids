//
//  UIViewControllerExtension.swift
//  MathForKids
//
//  Created by Abhimanyu Rathore on 27/06/21.
//  Copyright © 2021 Smriti. All rights reserved.
//

import Foundation
import UIKit


class CommonUtils{
    
    static func getVcObject(storyboardName:String,vcIdentifier:String)->UIViewController {
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: vcIdentifier)
        return vc
    }
    
    
    static func showAlertWithOkAndCancel(vc:UIViewController,title:String,message:String,ok:@escaping (()->()),cancel:@escaping(()->())){
        
        let refreshAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
              print("Handle Ok logic here")
            ok()
        }))

        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
              print("Handle Cancel Logic here")
            cancel()
        }))

        vc.present(refreshAlert, animated: true, completion: nil)
        
        
    }
    
    static func showAlertWithOkay(vc:UIViewController,title:String,message:String,ok:@escaping (()->())){
        
        let refreshAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
              print("Handle Ok logic here")
            ok()
        }))

        vc.present(refreshAlert, animated: true, completion: nil)
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
}

