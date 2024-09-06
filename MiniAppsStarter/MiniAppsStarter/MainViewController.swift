//
//  ViewController.swift
//  MiniAppsStarter
//
//  Created by Дима on 9/5/24.
//

import UIKit
import WeatherPack

public class ViewController: UITabBarController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MiniApp Display"
        
        let miniAppVC1_8 = MiniAppTableViewController(numOfMiniApps: 10, numOfCellsInFrame: 8)
        miniAppVC1_8.tabBarItem = UITabBarItem(title: "1/8", image: nil, tag: 0)
        
        let miniAppVC1_2 = MiniAppTableViewController(numOfMiniApps: 10, numOfCellsInFrame: 2)
        miniAppVC1_2.tabBarItem = UITabBarItem(title: "1/2", image: nil, tag: 1)
        
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 20)], for: .normal)

        // Добавляем все контроллеры в TabBarController
        self.viewControllers = [miniAppVC1_8, miniAppVC1_2]
    }
}
