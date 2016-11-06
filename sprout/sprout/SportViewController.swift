//
//  SportViewController.swift
//  sprout
//
//  Created by Yating Zhan on 10/20/16.
//  Copyright © 2016 Yating Zhan. All rights reserved.
//

import UIKit
// DatePicker is not very flexible, consider using picker View instead.
class SportViewController: UIViewController {
    
    @IBOutlet weak var exerciseTimePicker: UIDatePicker!
    @IBOutlet var sportBtns: [SportButton]!

    let appDel = UIApplication.shared.delegate! as! AppDelegate
    var sportType: String = ""
    var minutes: Int = 0
    var exercise: Activity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exerciseTimePicker.setValue(UIColor .orange, forKey: "textColor")
        // TODO: try to set the maximun time to 5 hours, right now it shows 24 hours, which 
        // doesn't make sense
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Bug: the user has to move both columns for the minutes to be set, otherwise, the min is 0
    @IBAction func timeSet(_ sender: AnyObject) {
        self.minutes = Int(exerciseTimePicker.countDownDuration/60)
    }
    
    @IBAction func chooseSport(_ sender: SportButton) {
        // Get rid of previously chosen one, because the user is only allowed to choose one 
        // sport each time
        for btn in sportBtns {
            if btn.chosen {
                btn.chosen = false
                btn.setImage(UIImage.init(named: btn.currentTitle!), for: UIControlState.normal)
            }
        }
        sportType = sender.currentTitle!
        sender.chosen = true
        
        // TODO: after MC provides the icons with circles
        //sender.setImage(UIImage.init(named: sender.currentTitle!+"chosen"), for: UIControlState.selected)
        
    }
    
    @IBAction func doneBtnPressed(_ sender: AnyObject) {
        exercise = Activity.init(sport: sportType, minutes: minutes)
        appDel.user?.activities.append(exercise!)
        print("Sport: ?, Minutes: ?",sportType, minutes)
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
