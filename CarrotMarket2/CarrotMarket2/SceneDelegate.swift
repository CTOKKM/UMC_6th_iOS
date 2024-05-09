//
//  SceneDelegate.swift
//  CarrotMarket2
//
//  Created by KKM on 5/9/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let mainViewController = UINavigationController(rootViewController: ViewController())
        let secondViewController = UINavigationController(rootViewController: NeighborViewController())
        let thirdViewController = UINavigationController(rootViewController: aroundViewController())
        let fourthViewController = UINavigationController(rootViewController: ChatViewController())
        let fifthViewController = UINavigationController(rootViewController: MyPageViewController())
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([mainViewController, secondViewController, thirdViewController, fourthViewController, fifthViewController], animated: true)
        
        
        if let items = tabBarController.tabBar.items {
            items[0].image = UIImage(systemName: "house")
            items[0].selectedImage = UIImage(systemName: "house.fill")
            items[0].title = "홈"
            
            items[1].image = UIImage(systemName: "newspaper")
            items[1].selectedImage = UIImage(systemName: "newspaper.fill")
            items[1].title = "동네생활"
            
            items[2].image = UIImage(systemName: "mappin.and.ellipse.circle")
            items[2].selectedImage = UIImage(systemName: "mappin.and.ellipse.circle.fill")
            items[2].title = "내 근처"
            
            items[3].image = UIImage(systemName: "bubble.left.and.text.bubble.right")
            items[3].selectedImage = UIImage(systemName: "bubble.left.and.text.bubble.right.fill")
            items[3].title = "채팅"
            
            items[4].image = UIImage(systemName: "person.crop.circle")
            items[4].selectedImage = UIImage(systemName: "person.crop.circle.fill")
            items[4].title = "나의 당근"
            
        }
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
       }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }

   

}

