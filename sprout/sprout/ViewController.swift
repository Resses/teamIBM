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

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var addScoreLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var scoreBar: UIProgressView!
    @IBOutlet weak var foodItemLabel: UILabel!
    
    @IBOutlet weak var eatBtn: UIButton!
    @IBOutlet weak var foodItemImageView: UIImageView!
    let appDel = UIApplication.shared.delegate! as! AppDelegate
    var timer: Timer?
    var chosenImage: UIImage?
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
    
    @IBAction func scanFood(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func eatBtnPressed(_ sender: Any) {
        self.foodItemImageView.isHidden = true
        self.eatBtn.isHidden = true
        self.foodItemLabel.isHidden = false
        self.addScoreLabel.isHidden = false
        self.foodItemLabel.text = "Banana"
        self.addScoreLabel.text = "+1pt!"
        
        UIView.animate(withDuration: 3.0, animations: addScoreBar, completion: completeEating)
    }
    
    
    func addScoreBar() -> Void {
        
        appDel.user!.score += 1
        scoreBar.setProgress(Float(appDel.user!.score) / 10.0, animated: true)
        
    }
    func completeEating(_: Bool) -> Void {
        self.foodItemLabel.isHidden = true
        self.addScoreLabel.isHidden = true
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        self.chosenImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.foodItemImageView.image = self.chosenImage
        self.eatBtn.isHidden = false
        self.eatBtn.isEnabled = true
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        if segue.identifier == "homeToFood" {
//            print("Going to Food View!!!!!")
//            let foodViewController = segue.destination as! FoodViewController
//            foodViewController.scanImageView?.image = self.chosenImage
//        }
//        
//    }
    
    

}

