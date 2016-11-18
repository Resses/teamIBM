//
//  ViewController.swift
//  sprout
//
//  Created by Yating Zhan on 10/20/16.
//  Copyright © 2016 Yating Zhan. All rights reserved.
//

import UIKit
import Firebase
import CoreFoundation

class ViewController: UIViewController {
    @IBOutlet weak var addScoreLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var scoreBar: UIProgressView!
    let appDel = UIApplication.shared.delegate! as! AppDelegate
    var currentScore: Int = 0
    let animationTimeInterval: TimeInterval = 3.0
    var addScore: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        addScoreLabel.text = addScore
        self.currentScore = appDel.user!.score
        scoreBar.setProgress(Float(self.currentScore) / 10.0, animated: true)
        let scale = CGAffineTransform(scaleX: 1, y: 10)
        let rotation = CGAffineTransform(rotationAngle:(1.5 * CGFloat(M_PI)))
        self.scoreBar.transform = scale.concatenating(rotation)
        //avatarImageView.image = appDel.user!.avatarImage
        UIView.animate(withDuration: animationTimeInterval, animations: {
            self.avatarImageView.image = self.appDel.user!.avatarImage
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

