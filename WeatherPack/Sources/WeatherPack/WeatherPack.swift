// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit

public class MyTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Настройка TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = self.view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(tableView)
    }

    // MARK: - UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10  // Например, 10 строк
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "Row \(indexPath.row + 1)"
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Selected row \(indexPath.row + 1)")
    }
}
