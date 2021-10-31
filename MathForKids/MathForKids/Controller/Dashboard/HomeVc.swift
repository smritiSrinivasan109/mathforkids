//
//  HomeVc.swift
//  MathForKids

import UIKit
import CoreData

class HomeVc: UIViewController {
    
    @IBOutlet weak var lblWelcome: UILabel!
    
    var user:User?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = user {
            self.lblWelcome.text = "Hey \(user.firstName ?? "") , Welcome to MathsForKids!! :)"
        }
        self.title = "Home"
    }
    
    //MARK:- UIBarButtonItem Actions
    @IBAction func btnLogoutTaped(_ sender: Any) {
        
        UserDefault.removeUserCredentials()
        
        
        
    }
    
    
    //MARK:- UIButton Actions

    @IBAction func btnAddtionTaped(_ sender: Any) {
        print("btnAddtionTaped")
        
        
        Operator.shared.selectedOperatorType = .addition

        let vcLevel =  CommonUtils.getVcObject(storyboardName:"Home" , vcIdentifier: "LevelsVc") as! LevelsVc
        vcLevel.user = user
        self.navigationController?.pushViewController(vcLevel, animated: true)
    }
    @IBAction func btnMultiplicationTaped(_ sender: Any) {
        print("btnMultiplicationTaped")
        Operator.shared.selectedOperatorType = .multiplication
        let vcLevel =  CommonUtils.getVcObject(storyboardName:"Home" , vcIdentifier: "LevelsVc") as! LevelsVc
        vcLevel.user = user
        self.navigationController?.pushViewController(vcLevel, animated: true)
    }
    @IBAction func btnDivisionTaped(_ sender: Any) {
        print("btnDivisionTaped")
        Operator.shared.selectedOperatorType = .division
        let vcLevel =  CommonUtils.getVcObject(storyboardName:"Home" , vcIdentifier: "LevelsVc") as! LevelsVc
        vcLevel.user = user
        self.navigationController?.pushViewController(vcLevel, animated: true)
    }
    @IBAction func btnSubstrationTaped(_ sender: Any) {
        print("btnSubstrationTaped")
        Operator.shared.selectedOperatorType = .subtraction
        let vcLevel =  CommonUtils.getVcObject(storyboardName:"Home" , vcIdentifier: "LevelsVc") as! LevelsVc
        vcLevel.user = user
        self.navigationController?.pushViewController(vcLevel, animated: true)
    }
    
}
