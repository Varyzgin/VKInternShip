import UIKit
import CounterPack

class MiniAppTableViewHalf: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView = UITableView()
    let cellIdentifier = "MiniAppCell"
    let miniApps : [CounterMiniApp]
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(miniApps : [CounterMiniApp]) {
        self.miniApps = miniApps
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTableView() // Пересоздание таблицы каждый раз при отображении вкладки
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tableView.removeFromSuperview() // Удаление таблицы при уходе с вкладки
    }
    
    func setupTableView() {
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return miniApps.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        let miniApp = miniApps[indexPath.row]
        miniApp.configureViewForHalf()  // Вызываем конфигурацию для 1/2

        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        miniApp.label.frame = cell.contentView.bounds
        cell.contentView.addSubview(miniApp.label)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let safeAreaHeight = tableView.frame.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom
        return safeAreaHeight / CGFloat(2) // Каждая ячейка занимает 1/8 высоты экрана
    }
}
