//
//  AppDelegate.swift
//  Swift-Project-Demo
//
//  Created by 陈文杰 on 2021/12/17.
//

import UIKit
import Hero

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.hero.isEnabled = true // 开启hero
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}
