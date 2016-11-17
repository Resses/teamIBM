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
        scoreBar.setProgress(Float((friend?.score)!) / 100.0, animated: true)
        let scale = CGAffineTransform(scaleX: 1, y: 10)
        let rotation = CGAffineTransform(rotationAngle:(1.5 * CGFloat(M_PI)))
        self.scoreBar.transform = scale.concatenating(rotation)

        waterLabel.text = String((friend?.cupsOfWater)!)
        var exerciseMin = 0
        for exercise in (friend?.activities)! {
            exerciseMin += exercise.minutes
            
        }
        exerciseLabel.text = String.init(format: "? Hours ? Minutes", (exerciseMin/60), (exerciseMin % 60))
        sleepLabel.text = String((friend?.hoursOfSleep)!)
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
