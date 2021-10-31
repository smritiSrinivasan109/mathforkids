//
//  QuestionsVc.swift
//  MathForKids


import UIKit

class QuestionsVc: UIViewController {
    
    
    lazy var toolBar:UIToolbar  = {
       let tb = UIToolbar()
        tb.backgroundColor = UIColor.init(red: 105.0/255.0, green: 105.0/255.0, blue: 105.0/255.0, alpha: 0.75)
        tb.barStyle = .default
        tb.frame = CGRect.init(x: 0, y: 0, width: screenWidth , height: screenWidth*0.12)
        let btnDone  = UIButton.init(type: .custom)
        btnDone.setTitle("Done", for: .normal)
        btnDone.setTitleColor(.black, for: .normal)
        btnDone.addTarget(self, action: #selector(btnDoneTapedFromToolBar(btn:)), for:.touchUpInside)
        let doneButton = UIBarButtonItem.init(customView: btnDone)
        let flexibleItem = UIBarButtonItem.flexibleSpace()
        tb.setItems([flexibleItem,doneButton], animated: true)
        return tb
    }()

    //UI Objects
    @IBOutlet weak var lblCurrentQuestion: UILabel!
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var btnNextSubmit: UIButton!
    
    
    
    
    lazy var questions:[QuestionModel]  = {
        var qsns:[QuestionModel] = [QuestionModel]()
        for qsn in level!.questions! {
            qsns.append(qsn as! QuestionModel)
        }
        qsns.sort { q1, q2 in
            return Int(q1.questionTitle!)! < Int(q2.questionTitle!)!
        }
    return qsns
    }()
    
    //question counter
    var currentQuestionNumber:Int  = 0
    var resultList:[Int64] = [Int64]()
    
    // MARK: model object
     var level:Level?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTopNAvigationBar()
        showQuestionToUser()
        txtInput.inputAccessoryView = toolBar
        
        CommonUtils.showAlertWithOkAndCancel(vc: self, title: "MathForKids", message: "you want to start the game?") {
            self.startGame()
        } cancel: {
            self.navigationController?.popViewController(animated: true)
        }
        
        
        
    
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.navigationBar.isHidden = false
    }
    
}

extension QuestionsVc:UITextFieldDelegate {
    
    //MARK:- Set Up Top Navigation Bar
    func setUpTopNAvigationBar(){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK:- UITeUITextField Delegate function
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    //MARK:- UIButton Actions
    @IBAction func btnNextOrSubmitTaped(_ sender: Any) {
        print("next or submit taped")
        
        if txtInput.text == nil {
            CommonUtils.showAlertWithOkay(vc: self, title: appName, message: "Please Fill your Answer First!") {}
            return
        }
        if txtInput.text!.isEmpty {
            CommonUtils.showAlertWithOkay(vc: self, title: appName, message: "Please Fill your Answer First!") {}
            return
        }
        
        if self.btnNextSubmit.titleLabel?.text == "Submit" {
            //you need to submit game to database (after all calculation of score)
            TimerManager.shared.stopTimer()
        }else{
           
            currentQuestionNumber = currentQuestionNumber + 1
            //load the answer in to resultList
            if let text =  txtInput.text {
                resultList.append(Int64(text) ?? 0)
            }
            showQuestionToUser()
            txtInput.text = ""
        }
        
        if currentQuestionNumber == 19 {
            self.btnNextSubmit.setTitle("Submit", for: .normal)
        }
        
    }
    func showQuestionToUser(){
        var operatorValue = ""
        switch Operator.shared.selectedOperatorType! {
        case .addition: operatorValue = "+"
        case .multiplication: operatorValue = "*"
        case .subtraction:operatorValue = "-"
        case .division:operatorValue = "/"
        
        }
        self.lblQuestion.text = "\(questions[currentQuestionNumber].x) \(operatorValue) \(questions[currentQuestionNumber].y) = "
        self.lblCurrentQuestion.text = "\(currentQuestionNumber+1) / 20"
    }
    
    
    @IBAction func btnCloseTaped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        TimerManager.shared.timer.invalidate()
        TimerManager.shared.timer = nil
    }
    
    //MARK:- Tool Bar Actions list
    @objc func btnDoneTapedFromToolBar(btn:UIButton){
         txtInput.resignFirstResponder()
    }
    
    
}


//ztimer feature
extension QuestionsVc {
    
    func startGame() {
        
        TimerManager.shared.startTimer()
        
        TimerManager.shared.timerRunning = {
            //do the stuff here while timer running (update the user with label second values )
            DispatchQueue.main.async {
                print("timer running with value : \(TimerManager.shared.currentTime)")
                self.lblTimer.text = String(TimerManager.shared.currentTime)
            }
        }
        
        TimerManager.shared.timeStoped = {
            print("timer stopped")
            var resultScore = self.submitAnswersAndUpdateScore()
            if resultScore < levelScoreLimit {
                
                CommonUtils.showAlertWithOkay(vc: self, title: appName, message: "Hey Sorry, you scored\(resultScore)") {
                    self.navigationController?.popViewController(animated: true)
                }
                
                
            }else{
                CommonUtils.showAlertWithOkay(vc: self, title: appName, message: "Hey Congratulations, you scored\(resultScore)") {
                    self.navigationController?.popViewController(animated: true)
                }
                
            }
            
            

            //check game's all qwuestions are completed or not ?
            //if not , say sorry and come out from the game
            
            //if yes , calculate score , if it is more than equal to 85% then congratz , update DB and comeout.
        }
    }
    
    
    
}


//MARK:- Add Tool Bar on TextField keyboard
extension QuestionsVc {
    
    
    
}
