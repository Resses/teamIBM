//
//  User.swift
//  sprout
//
//  Created by Renee Esses on 10/21/16.
//  Copyright © 2016 Yating Zhan. All rights reserved.
//


import Foundation
import FirebaseAuth
import UIKit

class User {
    var uid: String
    var firstName: String
    var lastName: String
    var parentEmail: String
    var likes: Int = 0 // Number of likes received from friends
    var score: Int = 0
    var cupsOfWater: Int = 0
    var hoursOfSleep: Double = 0
    var timeSlept: Date = Date()
    var timeWoke: Date = Date()
    var headImage: UIImage = UIImage.init(named: "face_normal")!
    var food = [Food]()
    var activities = [Activity]()
    var friends = [User]()
    
    init(authData: FIRUser,  firstName: String, lastName: String) {
        uid = authData.uid
        parentEmail = authData.email!
        self.firstName = firstName
        self.lastName = lastName
    }
    
    init(uid: String, firstName: String, lastName: String, parentEmail: String) {
        self.uid = uid
        self.firstName = firstName
        self.lastName = lastName
        self.parentEmail = parentEmail
    }
}
