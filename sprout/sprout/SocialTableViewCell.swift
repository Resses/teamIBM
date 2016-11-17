//
//  SocialTableViewCell.swift
//  sprout
//
//  Created by Yating Zhan on 11/15/16.
//  Copyright © 2016 Yating Zhan. All rights reserved.
//

import UIKit

class SocialTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendScoreBar: UIProgressView!
    @IBOutlet weak var likeBtn: UIButton!
    var friendScore: Int? = 0
    var friend: User?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likeBtn.isEnabled = true
        let scale = CGAffineTransform(scaleX: 1, y: 9)
        self.friendScoreBar.transform = scale
        if likeBtn.isSelected {
            likeBtn.setImage(#imageLiteral(resourceName: "thumb-color"), for: UIControlState.selected)
        }else{
            likeBtn.setImage(#imageLiteral(resourceName: "thumb-grey"), for: UIControlState.normal)
        }
        // Initialization code
    }

    @IBAction func likeBtnPressed(_ sender: UIButton) {
        if !sender.isSelected{
            sender.setImage(#imageLiteral(resourceName: "thumb-color"), for: UIControlState.normal)
            sender.isSelected = true
        }else{
            sender.setImage(#imageLiteral(resourceName: "thumb-grey"), for: UIControlState.selected)
            sender.isSelected = false
        }
    }

}
