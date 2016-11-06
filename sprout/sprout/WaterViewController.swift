//
//  WaterViewController.swift
//  sprout
//
//  Created by Yating Zhan on 10/20/16.
//  Copyright © 2016 Yating Zhan. All rights reserved.
//

import UIKit

class WaterViewController: UIViewController {

    @IBOutlet weak var cup1: UIButton!
    @IBOutlet weak var cup2: UIButton!
    @IBOutlet weak var cup3: UIButton!
    @IBOutlet weak var cup4: UIButton!
    @IBOutlet weak var cup5: UIButton!
    @IBOutlet weak var cup6: UIButton!
    @IBOutlet weak var cup7: UIButton!
    @IBOutlet weak var cup8: UIButton!
    var cups: [UIButton] = [UIButton]()
    
    let appDel = UIApplication.shared.delegate! as! AppDelegate
    var cupDrank: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//      appDel.waterView.performAction()
        self.cupDrank = appDel.user!.cupsOfWater
        self.cups = [self.cup1, self.cup2, self.cup3, self.cup4, self.cup5, self.cup6, self.cup7, self.cup8]
        if self.cupDrank > 0 {
            for i in 0...self.cupDrank-1 {
                self.cups[i].setImage(#imageLiteral(resourceName: "watercupBlue"), for: UIControlState.normal)
                self.cups.append(self.cups[i])
            }
        }
        
    }

    @IBAction func drink(_ sender: UIButton) {
        if sender.currentImage == #imageLiteral(resourceName: "watercupBlue"){
            sender.setImage(#imageLiteral(resourceName: "watercupGrey"), for: UIControlState.normal)
            self.cupDrank -= 1

        }else{
            
            sender.setImage(#imageLiteral(resourceName: "watercupBlue"), for: UIControlState.normal)
            self.cupDrank += 1
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneBtn(_ sender: AnyObject) {
        self.appDel.user?.cupsOfWater = self.cupDrank
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
