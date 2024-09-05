//
//  ViewController.swift
//  MiniAppsStarter
//
//  Created by Дима on 9/5/24.
//

import UIKit
import WeatherPack

class ViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()

            // Создаем кнопку
            let button = UIButton(type: .system)
            button.setTitle("Show Table", for: .normal)
            button.frame = CGRect(x: 100, y: 100, width: 150, height: 50)
            button.addTarget(self, action: #selector(showTableView), for: .touchUpInside)
            
            view.addSubview(button)
        }

        @objc func showTableView() {
            // Создаем экземпляр MyTableViewController
            let tableVC = MyTableViewController()
            navigationController?.pushViewController(tableVC, animated: true)
        }


}

