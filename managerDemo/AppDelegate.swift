//
//  AppDelegate.swift
//  managerDemo
//
//  Created by HouWan on 2021/6/8.
//

import UIKit
import MGJRouter_Swift
import ZJHHome

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        MGJRouter.registerWithHandler("ZJH://ZJHHome/HomeVC") { (param) in
            let userInfo = param![MGJRouterParameterUserInfo] as! [String : Any]
            let navicationVC = userInfo["navigation"] as! UINavigationController
            navicationVC.pushViewController(HomeViewController(), animated: true)
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}