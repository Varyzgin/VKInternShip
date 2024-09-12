import UIKit
import CounterPack

class MiniAppFullScreenViewController: UIViewController {
    var miniApp: CounterMiniApp?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        guard let miniApp = miniApp else { return }
        miniApp.configureViewForFull()  // Конфигурация для полного экрана
        
        miniApp.label.frame = view.bounds
        view.addSubview(miniApp.label)
    }
}
