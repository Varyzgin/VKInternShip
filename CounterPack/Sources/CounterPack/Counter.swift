import UIKit

protocol MiniAppViewEighth {
    func configureViewForEighth()
}

protocol MiniAppViewHalf {
    func configureViewForHalf()
}

protocol MiniAppViewFull {
    func configureViewForFull()
}

public class CounterMiniApp: MiniAppViewEighth, MiniAppViewHalf, MiniAppViewFull {
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
        print("Configured for 1/8 view for \(id)")
    }
    
    // Реализация метода для 1/2 представления
    public func configureViewForHalf() {
        label.text = "\(id)"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        print("Configured for 1/2 view for \(id)")
    }

    // Реализация метода для полного экрана
    public func configureViewForFull() {
        label.text = "\(id)"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        print("Configured for Full Screen view for \(id)")
    }
}
