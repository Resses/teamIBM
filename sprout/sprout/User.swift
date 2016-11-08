//
//  User.swift
//  sprout
//
//  Created by Renee Esses on 10/21/16.
//  Copyright © 2016 Yating Zhan. All rights reserved.
//


import Foundation

class User {
    var username: String
    var password: String
    var firstName: String
    var lastName: String
    var parentEmail: String
    var score: Int = 0
    var cupsOfWater: Int = 0
    var hoursOfSleep: Double = 0
    var timeSlept: Date = Date()
    var timeWoke: Date = Date()

    var food = [Food]()
    var activities = [Activity]()
    var friends = [User]()
    
    init(username: String, password: String, firstName: String, lastName: String, parentEmail: String) {
        self.username = username
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.parentEmail = parentEmail
    }
}
