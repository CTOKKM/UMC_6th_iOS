//
//  SceneDelegate.swift
//  WeatherApp
//
//  Created by KKM on 6/25/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController = WeatherViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
