//
//  SportViewController.swift
//  sprout
//
//  Created by Yating Zhan on 10/20/16.
//  Copyright © 2016 Yating Zhan. All rights reserved.
//

import UIKit

class SportViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet var sportBtns: [UIButton]!

    @IBOutlet weak var exerciseTimePicker: UIPickerView!
    let appDel = UIApplication.shared.delegate! as! AppDelegate
    var sportType: String = ""
    var minutes: Int = 0
    var exercise: Activity?
    let pickerData = [
        ["0 hour", "1 hour", "2 hour", "3 hour", "4 hour", "5 hour"],
        ["0 min","10 min","20 min","30 min","40 min","50 min"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exerciseTimePicker.delegate = self
        exerciseTimePicker.dataSource = self
        exerciseTimePicker.selectRow(2, inComponent:0, animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chooseSport(_ sender: UIButton) {
        // This for-loop gets rid of previously chosen one, because the user is only allowed to choose one
        // sport each time
        for btn in sportBtns {
            if btn.isSelected {
                btn.isSelected = false
                btn.setImage(UIImage.init(named: btn.currentTitle!), for: UIControlState.normal)
            }
        }
        sportType = sender.currentTitle!
        sender.isSelected = true
        
        sender.setImage(UIImage.init(named: sender.currentTitle!+"_chosen"), for: UIControlState.selected)
        
    }
    
    @IBAction func doneBtnPressed(_ sender: AnyObject) {
        exercise = Activity.init(sport: sportType, minutes: minutes)
        appDel.user!.activities.append(exercise!)
        appDel.user!.score += 1
        print("Sport: ?, Minutes: ?",sportType, minutes)
        
    }
    //MARK: - Delegates and data sources
    
    //MARK: Data Sources
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[component][row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSForegroundColorAttributeName:UIColor.orange])
        return myTitle
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        setTime()
    }
    //MARK - Instance Methods
    func setTime(){
        let hour = pickerData[0][exerciseTimePicker.selectedRow(inComponent: 0)]
        let minute = pickerData[1][exerciseTimePicker.selectedRow(inComponent: 1)]
        self.minutes = Int(hour.components(separatedBy: " ")[0])! * 60 + Int(minute.components(separatedBy: " ")[0])!
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
