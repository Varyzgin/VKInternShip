//
//  Table1_8.swift
//  MiniAppsStarter
//
//  Created by Дима on 9/5/24.
//

import UIKit
import WeatherPack

class MiniAppTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView = UITableView()
    private let cellIdentifier = "MiniAppCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        // Настройка TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MiniAppTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        // Устанавливаем AutoLayout для TableView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // Указываем 8 ячеек
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MiniAppTableViewCell else {
            return UITableViewCell()
        }

        // Здесь можно вставить мини-приложение в контейнер каждой ячейки
        var miniApp = createMiniAppForCell(at: indexPath)
        cell.miniAppContainer.addSubview(miniApp.view)
        
        // Устанавливаем AutoLayout для мини-приложения в контейнере
        miniApp.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            miniApp.view.topAnchor.constraint(equalTo: cell.miniAppContainer.topAnchor),
            miniApp.view.bottomAnchor.constraint(equalTo: cell.miniAppContainer.bottomAnchor),
            miniApp.view.leadingAnchor.constraint(equalTo: cell.miniAppContainer.leadingAnchor),
            miniApp.view.trailingAnchor.constraint(equalTo: cell.miniAppContainer.trailingAnchor)
        ])

        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (tableView.frame.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom) / 8 // Каждая ячейка занимает 1/8 высоты экрана
    }

    // Создание мини-приложения для каждой ячейки
    private func createMiniAppForCell(at indexPath: IndexPath) -> UIViewController {
        // Здесь можно вставить логику выбора или создания мини-приложений.
        // Например, можно использовать ваш ResizableLabelViewController
        var miniAppVC = ResizableLabelViewController()
        miniAppVC.updateLabel(text: "Mini App \(indexPath.row + 1)")
        addChild(miniAppVC)
        miniAppVC.didMove(toParent: self)
        return miniAppVC
    }
}
