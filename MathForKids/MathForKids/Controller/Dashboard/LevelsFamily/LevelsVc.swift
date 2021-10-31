//
//  LevelsVc.swift
//  MathForKids


import UIKit
import CoreData

class LevelsVc: UIViewController {

    var user:User?
    
    lazy var additionLevels:[Level]  = {
        var levels:[Level] = [Level]()
        for level in self.user!.operatorManager!.addition!.levels! {
            levels.append(level as! Level)
        }
        levels.sort { level1, level2 in
            return Int(level1.title!)! < Int(level2.title!)!
        }
        
    return levels
    }()
    
    
    lazy var multLevels:[Level]  = {
        var levels:[Level] = [Level]()
        for level in self.user!.operatorManager!.multiplier!.levels! {
            levels.append(level as! Level)
        }
        levels.sort { level1, level2 in
            return Int(level1.title!)! < Int(level2.title!)!
        }
    return levels
    }()
    
    lazy var divideLevels:[Level]  = {
        var levels:[Level] = [Level]()
        for level in self.user!.operatorManager!.division!.levels! {
            levels.append(level as! Level)
        }
        levels.sort { level1, level2 in
            return Int(level1.title!)! < Int(level2.title!)!
        }
    return levels
    }()
    
    lazy var subtractionLevels:[Level]  = {
        var levels:[Level] = [Level]()
        for level in self.user!.operatorManager!.subtraction!.levels! {
            levels.append(level as! Level)
        }
        levels.sort { level1, level2 in
            return Int(level1.title!)! < Int(level2.title!)!
        }
    return levels
    }()
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:- model object
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationTitle()
    
        //registing LevelCell on table view
            self.tableView.register(UINib.init(nibName: "LevelCell", bundle: nil), forCellReuseIdentifier: CellConstants.levelCellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    
}

//UI Related extension function
extension LevelsVc {
    
    func setNavigationTitle(){
        switch Operator.shared.selectedOperatorType {
        case .addition:
            self.title = "Addition"
        case .multiplication:
            self.title = "Multiplication"
        case .division:
            self.title = "Division"
        case .subtraction:
            self.title = "Subtraction"
        case .none:
            self.title  = ""
        }
    }
}

