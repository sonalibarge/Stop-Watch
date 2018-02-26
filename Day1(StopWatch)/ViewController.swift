//
//  ViewController.swift
//  Day1(StopWatch)
//
//  Created by Sonali on 1/6/18.
//  Copyright © 2018 Sonali. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {

    @IBOutlet weak var startButton: UIButton!
    internal var intCounter : Int = 0
    internal var elapsedTimeCounter : Int = 0
    var startTime : String = ""
    var endTime : String = ""
    @IBOutlet weak var timerTableView: UITableView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var differenceLabel: UILabel!
    var timer = Timer()
    var elapseTimer = Timer()
    var elapsedTimerArray = [String]()
    var elapsedReversedTimerArray = [String]()
    var isStart : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

  func createElasedTimer(){
   
    elapseTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(elasedTimerMethod), userInfo: nil, repeats: true)
  
    }

    @IBAction func startButtonAction(_ sender: Any) {
        if !isStart{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updatetimer), userInfo: nil, repeats: true)
            self.createElasedTimer()
            isStart = true
            startButton.setTitle("Stop", for: .normal)
        }else{
            isStart = false
             startButton.setTitle("Start", for: .normal)
            differenceLabel.text   = "00 : 00.00"
            elapsedTimeCounter = 0
            elapsedReversedTimerArray = [];
            elapsedReversedTimerArray = elapsedTimerArray.reversed()
            timerLabel.text = "00 : 00.00"
            timer.invalidate()
        }
    }
    
    @objc func updatetimer()  {
        intCounter += 1
        timerLabel.text = String(format: "%02d : %02d.%02d", (intCounter / 3600),(intCounter % 3600)/60,(intCounter % 3600)%60)
        
    }
    @objc func elasedTimerMethod()  {
         if isStart{
        elapsedTimeCounter += 1
        differenceLabel.text = String(format: "%02d : %02d.%02d", (elapsedTimeCounter / 3600),(elapsedTimeCounter % 3600)/60,(elapsedTimeCounter % 3600)%60)
        }
    }
    @IBAction func differenceButtonAction(_ sender: Any) {
        elapsedTimerArray.append(differenceLabel.text!)
        differenceLabel.text   = "00 : 00.00"
        elapsedTimeCounter = 0
        elapseTimer.invalidate()
        self.createElasedTimer()
        elapsedReversedTimerArray = [];
        elapsedReversedTimerArray = elapsedTimerArray.reversed()
        self.timerTableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elapsedReversedTimerArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let timerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TimerTableViewCell", for: indexPath) as! TimerTableViewCell
        if elapsedReversedTimerArray.count > 0{
        timerTableViewCell.timerDifferenceCounter.text = "Elapsed \(elapsedReversedTimerArray.count - indexPath.row)"
        timerTableViewCell.totalDifferenceLabel.text = elapsedReversedTimerArray[indexPath.row]
        }
        return timerTableViewCell
    }
    
}

