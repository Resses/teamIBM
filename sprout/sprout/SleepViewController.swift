//
//  SleepViewController.swift
//  sprout
//
//  Created by Yating Zhan on 10/20/16.
//  Copyright © 2016 Yating Zhan. All rights reserved.
//

import UIKit

class SleepViewController: UIViewController {

    @IBOutlet weak var timeSlept: UIDatePicker!
    @IBOutlet weak var timeWoke: UIDatePicker!
    @IBOutlet weak var sleepLabel: UILabel!
    @IBOutlet weak var wakeLabel: UILabel!
    @IBOutlet weak var hoursSleptLabel: UILabel!
    @IBOutlet weak var done: UIButton!
    
    @IBOutlet weak var home: UIButton!
    let appDel = UIApplication.shared.delegate! as! AppDelegate
    var hoursOfSleep: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hoursOfSleep = appDel.user!.hoursOfSleep

        //alignment()
        
        //Use times and number of hours saved in appdel if available
        if(self.hoursOfSleep > 0){
            hoursSleptLabel.text = self.hoursOfSleep.description + " hours"
            timeSlept.date = appDel.user!.timeSlept
            timeWoke.date = appDel.user!.timeWoke
        }
        //else clear the label for hours slept and set default sleep and wake times
        else{
            hoursSleptLabel.text = ""
            setInitialTimes()
        }
    }
    
    func setInitialTimes(){
        let date: Date = Date()
        let cal: Calendar = Calendar(identifier: .gregorian)
        let defaultSleepTime: Date = cal.date(bySettingHour: 21, minute: 30, second: 0, of: date)!
        timeSlept.date = defaultSleepTime
        let defaultWakeTime: Date = cal.date(bySettingHour: 7, minute: 0, second: 0, of: date)!
        timeWoke.date = defaultWakeTime
    }

    //possible way of sizing/aligning content based on screen width/height. Not completed, just here as an example...
    func alignment() {
        let width = self.view.frame.size.width
        //375 is the width of the phone its on now. Use that to calculate relative sizes
        home.frame = CGRect(x: 5, y: 5, width: width / 5.35 , height: width / 5.35)
        
        sleepLabel.frame = CGRect(x: 0, y: self.home.frame.maxY + 5, width: width, height: 21)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateHours(_ sender: UIDatePicker) {
        //Calculate the number of hours the user slept
        //Display that value in hoursOfSleepLbl
        
        //get the number of hours between the two times
        var time = round((timeWoke.date.timeIntervalSince(timeSlept.date))/1800) / 2.0
        //negative hours would occur because sleeping is the day before. Add 24 hours.
        if(time < 0){
            time = 24 + time
        }
        //for more than 24 hours, do time % 24
        if(time > 24){
            time = time.truncatingRemainder(dividingBy: 24)
        }
        self.hoursOfSleep = time


        //Display hours slept on the label
        hoursSleptLabel.text  = String(format: time == floor(time) ? "%.0f" : "%.1f", time) + " hours"
    }
    
    @IBAction func doneBtn(_ sender: AnyObject) {
        self.appDel.user?.hoursOfSleep = self.hoursOfSleep
        self.appDel.user?.timeSlept = self.timeSlept.date
        self.appDel.user?.timeWoke = self.timeWoke.date
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
