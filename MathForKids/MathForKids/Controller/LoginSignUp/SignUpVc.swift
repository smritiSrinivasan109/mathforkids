//
//  SignUpVc.swift
//  MathForKids


import UIKit

class SignUpVc: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    
    // MARK: model object
    lazy var signupModel:SignUpModel = {
        let model = SignUpModel()
        return model
    }()
    
    // MARK: View Life Cycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func btnSignInClicked(_ sender: Any) {
        print("btnSignInClicked")
        
    }
    
    
    @IBAction func btnSignUpClicked(_ sender: Any) {
        print("btnSignUpClicked")
        
        //save the new fresh user in to data base
        //TO DO:- Email validation
        if txtEmail.text == nil || txtFirstName.text == nil
            || txtLastName.text == nil || txtPassword.text == nil
            || txtConfirmPassword.text == nil  {
            CommonUtils.showAlertWithOkay(vc: self, title: appName, message:"every textfield must filled properly") {
            }
            print("every textfield must filled properly")
        }else if txtEmail.text!.isEmpty  || txtFirstName.text!.isEmpty
                    || txtLastName.text!.isEmpty || txtPassword.text!.isEmpty
                    || txtConfirmPassword.text!.isEmpty  {
            print("every textfield must filled properly")
            CommonUtils.showAlertWithOkay(vc: self, title: appName, message:"every textfield must filled properly") {
            }
        }
        else if  txtPassword.text != txtConfirmPassword.text  {
            print("confirm password should match from Password")
            CommonUtils.showAlertWithOkay(vc: self, title: appName, message:"confirm password should match from Password") {
            }
        }else {
            //good to go and save user in DB
            
            //update model and load it on DataBase
            signupModel.email = txtEmail.text!
            signupModel.firstName = txtFirstName.text!
            signupModel.lastName = txtLastName.text!
            signupModel.password = txtPassword.text!
            
            //fill this user in to database
            DBManager.shared.saveUser(signUpModel: signupModel)
            
            //Save the current user in to temp userdefaulot as welll for comparing and deciding  rout
            UserDefault.saveInUserCredentials(email: signupModel.email!, password: signupModel.password!)
            
            applicationDelegate?.decideRouteOnBasisOfUser()
        
        }
        
        
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
