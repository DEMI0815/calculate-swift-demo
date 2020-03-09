//
//  AppDelegate.swift
//  Calculate1
//
//  Created by Yidi Zhao on 2019/10/14.
//  Copyright © 2019 Yidi Zhao. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var user1View: UIImage!
    var user2View: UIImage!
    var user3View: UIImage!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window?.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        //下面这句一定得加上，否则不会有任何动画
        self.window?.makeKeyAndVisible()
        
        print("application: 当程序载入后执行")
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        print("applicationWillResignActive: 应用将进入非活动状态，即将进入后台。可以暂停正在进行的任务")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        print("applicationDidEnterBackground: 应用如果可以后台运行，则在后台运行")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        print("applicationWillEnterForeground: 应用将要进入活动状态，即将进入前台运行")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        print("applicationDidBecomeActive: 应用已进入前台，处于活动状态")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        print("applicationWillTerminate: 应用即将退出，可用于保存数据")
    }


}

