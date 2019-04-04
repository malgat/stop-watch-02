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
    
    var time = 00
    var sec = 00
    var min = 00
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
        
        myTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTime), userInfo:nil, repeats: true) //1초마다 호출하는 타이머.
        
        
        ChangeButtonState(start:false, pause:true, stop:true)
    }
    
    @IBAction func pauseBtnPressed(_ sender: Any) {
        myTimer.invalidate()    //타이머 정지. 상태 유지중.
        ChangeButtonState(start:true, pause:false, stop:true)
    }
    
    @IBAction func resetBtnPressed(_ sender: Any) {
        myTimer.invalidate()
        time = 00
        timeLabel.text = String(time)
        
        ChangeButtonState(start:true, pause:false, stop:false)
    }
    
    @objc func updateTime(){
        time += 1
        
        let min = time/6000
        let sec = time/100 - (min*60)
        let ssec = time % 100
        timeLabel.text = String(format : "%02d:%02d:%02d", min, sec, ssec)
    }
    func ChangeButtonState(start : Bool, pause : Bool, stop : Bool){
        startButton.isEnabled = start
        pauseButton.isEnabled = pause
        resetButton.isEnabled = stop
        
    }
}

