//
//  FriendPageViewController.swift
//  sprout
//
//  Created by Yating Zhan on 11/16/16.
//  Copyright © 2016 Yating Zhan. All rights reserved.
//

import UIKit

class FriendPageViewController: UIViewController {
    @IBOutlet weak var sleepLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var waterLabel: UILabel!
    //Need to change the imageView dynamically in the future
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var scoreBar: UIProgressView!
    var friend: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImageView.image = friend?.avatarImage
        scoreBar.setProgress(Float((friend?.score)!) / 100.0, animated: true)
        let scale = CGAffineTransform(scaleX: 1, y: 10)
        let rotation = CGAffineTransform(rotationAngle:(1.5 * CGFloat(M_PI)))
        self.scoreBar.transform = scale.concatenating(rotation)
        let waterString = String((friend?.cupsOfWater)!)
        if (friend?.cupsOfWater)! > 1{
            waterLabel.text = waterString + " Cups"
        }else{
            waterLabel.text = waterString + " Cup"
        }
        //waterLabel.text = String((friend?.cupsOfWater)!)
        var exerciseMin = 0
        for exercise in (friend?.activities)! {
            exerciseMin += exercise.minutes
            
        }
        let hour = Float(exerciseMin) / 60.0
        //let min = exerciseMin % 60
        var exerciseString = String(hour)
        if hour > 1 {
            exerciseString += " Hours "
        }else {exerciseString += " Hour "}
//        exerciseString += String(min)
//        if min > 1 {
//            exerciseString += " Mins"
//        }else {exerciseString += " Min"}
        //exerciseLabel.text = String.init(format: "? Hours ? Minutes", (exerciseMin/60), (exerciseMin % 60))
        exerciseLabel.text = exerciseString
        let shour = floor((friend?.hoursOfSleep)!)
        //let smin = (friend?.hoursOfSleep)!-shour * 60
        var sleepString = String(shour)
        if shour > 1 {
            sleepString += " Hours "
        }else {sleepString += " Hour "}
//        sleepString += String(floor(smin))
//        if smin > 1 {
//            
//            sleepString += " Mins"
//        }else {sleepString += " Min"}
        sleepLabel.text = sleepString
        
        //sleepLabel.text = String((friend?.hoursOfSleep)!)
        
        foodLabel.text = String((friend?.foodItems.count)!) + " Power Foods"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
