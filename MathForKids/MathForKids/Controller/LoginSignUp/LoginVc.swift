//
//  LoginVc.swift
//  MathForKids

import UIKit

class LoginVc: UIViewController,UITextFieldDelegate {
    
    //UI Objects
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    // MARK: model object
    lazy var loginModel:LoginModel = {
        let model = LoginModel()
        return model
    }()
    
    // MARK: View Life Cycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK:- UIBUTTON ACTIONS
    @IBAction func btnSigninTaped(_ sender: Any) {
        print("sign In tapped")
        //check in db if exist we will go to home after saving info in temp userdefault
        
        //TO DO:- Email validation
        if txtEmail.text == nil || txtPassword.text == nil {
            print("every textfield must filled properly")
            CommonUtils.showAlertWithOkay(vc: self, title: appName, message: "every textfield must filled properly") {
                
            }
        }else if txtEmail.text!.isEmpty  ||  txtPassword.text!.isEmpty
                      {
            print("every textfield must filled properly")
            CommonUtils.showAlertWithOkay(vc: self, title: appName, message: "every textfield must filled properly") {
                
            }
        }
        else {
            //good to go,  check in database
            if let user = UserDefault.userExistInDataBase(emailAddrees:txtEmail.text!  , pass:  txtPassword.text!) {
                //Save the current user in to temp userdefaulot as welll for comparing and deciding  rout
                UserDefault.saveInUserCredentials(email: txtEmail.text!, password:  txtPassword.text!)
            
                
                applicationDelegate?.decideRouteOnBasisOfUser()
            }else{
                CommonUtils.showAlertWithOkay(vc: self, title: appName, message:"Hey, you are entering wrong credential or user is not exist in database!!!!") {
                }
                print("Hey, you are entering wrong credential or user is not exist in database!!!!")
            }
        }
    }
    
    @IBAction func btnSignUPTaped(_ sender: Any) {
        print("sign UP tapped")
        let vcSignUp =  CommonUtils.getVcObject(storyboardName:"LoginSignup" , vcIdentifier: "SignUpVc") as! SignUpVc
        self.navigationController?.pushViewController(vcSignUp, animated: true)
    }
    
    //MARK:- UITextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }

    func textFieldDidEndEditing(_ textField: UITextField) {

        print("textFieldDidEndEditing")
    }
}

