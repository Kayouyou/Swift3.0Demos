//
//  AppDelegate.swift
//  Swift_反射机制
//
//  Created by 叶杨杨 on 2016/11/15.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // window是可选的
    var window: UIWindow?

    /**
     1,Swift中 有命名空间
     - 在同一个命名空间下，全局共享
     - 第三方使用，swfit如果直接使用从属于统一命名空间，有可能冲突
     2，重点知道： swift中 NSSClassFromString
     - 反射最重要的目的就是解构，多人开发时会经常使用
     - 
    */
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        // 代码中的 ？  都是可选解包 ，发送消息，本身不参与计算，所有的？xcode自动添加
        //1,实例化window
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        
        //2,设置根控制器，需要添加命名空间 ->默认就是项目名称（最好不要有数字和特殊符号）
//        let vc = ViewController()
        
        let clsName = "Swift_反射机制.ViewController"
        //AnyClass？ -》视图控制器类型
        let cls = NSClassFromString(clsName) as? UIViewController.Type
        let vc = cls?.init()
    
        window?.rootViewController = vc
        //3,window 可见
        window?.makeKeyAndVisible()
        
        
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

