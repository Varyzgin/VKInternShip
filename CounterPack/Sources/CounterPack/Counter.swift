import UIKit

public class CounterMiniApp {
    public var counter: Int = 0
    public let label = UILabel()
    let id: UUID
    
    public init(counter: Int = 0) {
        id = UUID()
        self.counter = counter
        print("Created \(id)")
    }
    
    // Реализация метода для 1/8 представления
    public func configureViewForEighth() {
        label.text = "\(id)"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        print("Configured  1/8 (\(id))")
    }
    
    // Реализация метода для 1/2 представления
    public func configureViewForHalf() {
        label.text = "\(id)"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        print("Configured 1/2 (\(id))")
    }

    // Реализация метода для полного экрана
    public func configureViewForFull() {
        label.text = "\(id)"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        print("Configured for Full Screen view for \(id)")
    }
}
