//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by KKM on 6/25/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = WeatherViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}
