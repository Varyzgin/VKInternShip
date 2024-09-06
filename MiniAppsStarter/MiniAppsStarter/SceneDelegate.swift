//
//  SceneDelegate.swift
//  MiniAppsStarter
//
//  Created by Дима on 9/5/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        let mainVC = MiniAppTableViewController()
        window.rootViewController = mainVC
        self.window = window
        window.makeKeyAndVisible()
    }
}
