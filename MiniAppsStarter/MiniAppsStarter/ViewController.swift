//
//  ViewController.swift
//  MiniAppsStarter
//
//  Created by Дима on 9/5/24.
//

import UIKit
import WeatherPack

class ViewController: UIViewController {
    private var resizableLabelVC: ResizableLabelViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let labelWidgetVC = ResizableLabelViewController()
        labelWidgetVC.updateLabel(text: "Digit")
        
        addChild(labelWidgetVC)
        labelWidgetVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelWidgetVC.view)
        labelWidgetVC.didMove(toParent: self)

        self.resizableLabelVC = labelWidgetVC // ссылка на текущий label
    }
   
}
