//
//  AppDelegate.swift
//  sprout
//
//  Created by Yating Zhan on 10/20/16.
//  Copyright © 2016 Yating Zhan. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var user: User!
    var window: UIWindow?
    var waterView: WaterViewController?
    var sportView: SportViewController?
    var sleepView: SleepViewController?
    var foodView: FoodViewController?
    var socialView = SocialViewController?.self
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FIRApp.configure()

        waterView = WaterViewController()
        sportView = SportViewController()
        sleepView = SleepViewController()
        foodView = FoodViewController()
        //socialView = SocialViewController()

        

        // A Fake user for now
        user = User.init(username: "Charlie", password: "12345", firstName: "Charlie", lastName: "Wu", parentEmail: "123@321.com")
        let friend1 = User.init(username: "Alex", password: "11111", firstName: "Alex", lastName: "Ann", parentEmail: "dlksf@ldk.com")
        friend1.cupsOfWater = 2
        friend1.hoursOfSleep = 7.5
        friend1.score = 40
        let friend2 = User.init(username: "Ben", password: "11111", firstName: "Ben", lastName: "Ann", parentEmail: "dlksf@ldk.com")
        let friend3 = User.init(username: "Max", password: "11111", firstName: "Max", lastName: "Ann", parentEmail: "dlksf@ldk.com")
        friend2.headImage = UIImage.init(named: "face_crying")!
        friend2.avatarImage = UIImage.init(named: "avatar_crying")!
        friend2.score = 30
        friend3.headImage = UIImage.init(named: "face_crying")!
        friend3.avatarImage = UIImage.init(named: "avatar_sleepy")!
        user!.friends = [friend1, friend2, friend3]
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

