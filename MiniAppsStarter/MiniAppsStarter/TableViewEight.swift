import UIKit
import CounterPack

class MiniAppTableViewEighth: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()  // Перезагружаем данные при каждом отображении
    }
    
    func setupTableView() {
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
        ])    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return miniApps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let miniApp = miniApps[indexPath.row]
        miniApp.configureViewForEighth()  // Вызываем конфигурацию для 1/8
        
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        miniApp.label.frame = cell.contentView.bounds
        cell.contentView.addSubview(miniApp.label)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let safeAreaHeight = tableView.frame.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom
        return safeAreaHeight / CGFloat(8) // Каждая ячейка занимает 1/8 высоты экрана
    }
}
