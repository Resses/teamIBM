//
//  SocialViewController.swift
//  sprout
//
//  Created by Yating Zhan on 11/15/16.
//  Copyright © 2016 Yating Zhan. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: Properties
    @IBOutlet weak var friendsTable: UITableView!
    
    let appDel = UIApplication.shared.delegate! as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsTable.delegate = self
        friendsTable.dataSource = self
        friendsTable.rowHeight = 100.0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (appDel.user.friends.count)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! SocialTableViewCell
        let currentFriend = appDel.user!.friends[indexPath.row]
        print(currentFriend.username)
        // cell.headImage = currentFriend.headImage
        cell.friendScore = currentFriend.score
//        if cell.friendNameLabel == nil{
//            cell.friendNameLabel = UILabel.init()
//            cell.friendNameLabel?.text = currentFriend.username
//        }
        cell.friend = currentFriend
        cell.friendScoreBar.setProgress(Float(currentFriend.score) / 100, animated: true)
        cell.friendNameLabel.text = currentFriend.username
        cell.friendNameLabel.textColor = UIColor.orange
        cell.friendNameLabel.textAlignment = NSTextAlignment.center
        cell.friendNameLabel.font = UIFont(name: "Chalkboard SE", size: 14.0)
        cell.headImage.image = currentFriend.headImage
        cell.isUserInteractionEnabled = true
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "viewFriendSegue" {
            let indexPath = self.friendsTable.indexPathForSelectedRow
            let friendHomeViewController = segue.destination as! FriendPageViewController
            friendHomeViewController.friend = appDel.user!.friends[(indexPath?.row)!]
            
        }

        
    }
    

}
