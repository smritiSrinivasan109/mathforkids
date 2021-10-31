//
//  TimerManager.swift
//  MathForKids
//
//  Copyright © 2021 Smriti. All rights reserved.
//

import Foundation
import Foundation
import UIKit
import CoreData

class TimerManager {

    //single tone object
    static var shared:TimerManager = TimerManager()

    //Timer Logic variables
    let timeLimitOfEachLevel:TimeInterval = 600 //10 minute 10*60 = 600
    
    var currentTime:Int = 0 // in seconds
    
    var timer:Timer!
    
    var timerRunning:(()->())?
    var timeStoped:(()->())?
    

    func startTimer(){
        self.timer = Timer.scheduledTimer(timeInterval:1.0, target: self, selector: #selector(timerCall), userInfo: nil, repeats: true)
    }
    
    @objc func timerCall(){
        
        currentTime = currentTime + 1
        print(currentTime)
        if currentTime == Int(timeLimitOfEachLevel) {
            stopTimer()
        }
        
        //inform somebody with currrent second
        if let timerRunning = timerRunning {
         timerRunning()
        }
    }
    
    func stopTimer(){
        self.timer.invalidate()
        self.timer = nil
        if let timerStoped = timeStoped {
            timerStoped()
        }
    }
    



}
