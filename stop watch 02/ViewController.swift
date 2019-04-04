//
//  ViewController.swift
//  stop watch 02
//
//  Created by D7703_22 on 2019. 4. 4..
//  Copyright © 2019년 fb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIBarButtonItem!
    @IBOutlet weak var pauseButton: UIBarButtonItem!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    var time = 0
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = String(time)
    }
    
    @IBAction func startBtnPressed(_ sender: Any) {
        if(myTimer.isValid){
            return;
        }
        
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo:nil, repeats: true) //1초마다 호출하는 타이머.
        
        
        ChangeButtonState(start:false, pause:true, stop:true)
    }
    
    @IBAction func pauseBtnPressed(_ sender: Any) {
        myTimer.invalidate()    //타이머 정지. 상태 유지중.
        ChangeButtonState(start:true, pause:false, stop:true)
    }
    
    @IBAction func resetBtnPressed(_ sender: Any) {
        myTimer.invalidate()
        time = 0
        timeLabel.text = String(time)
        
        ChangeButtonState(start:true, pause:false, stop:false)
    }
    
    @objc func updateTime(){
        time += 1
        timeLabel.text = String(time)
    }
    func ChangeButtonState(start : Bool, pause : Bool, stop : Bool){
        startButton.isEnabled = start
        pauseButton.isEnabled = pause
        resetButton.isEnabled = stop
        
    }
}

