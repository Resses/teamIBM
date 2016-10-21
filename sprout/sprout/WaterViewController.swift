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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    @IBAction func drink(_ sender: UIButton) {
//        let #imageLiteral(resourceName: "watercupGrey") = UIImage(named: "waterCupGrey")
//        let #imageLiteral(resourceName: "watercupBlue") = UIImage(named: "waterCupBlue")
        if sender.currentImage == #imageLiteral(resourceName: "watercupBlue"){
            sender.setImage(#imageLiteral(resourceName: "watercupGrey"), for: UIControlState.normal)
        }else{
            sender.setImage(#imageLiteral(resourceName: "watercupBlue"), for: UIControlState.normal)
        }
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
