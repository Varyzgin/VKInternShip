import UIKit
import CounterPack

public class ViewController: UITabBarController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MiniApp Display"
        
        var miniAppsArray = [CounterMiniApp]()
        for _ in 1...20 {
            miniAppsArray.append(CounterMiniApp())
        }
        
        // Создаем 2 контроллера для вкладок
        let miniAppEighthVC = MiniAppTableViewEighth(miniApps: miniAppsArray)
        miniAppEighthVC.tabBarItem = UITabBarItem(title: "1/8", image: nil, selectedImage: nil)
        
        let miniAppHalfVC = MiniAppTableViewHalf(miniApps: miniAppsArray)
        miniAppHalfVC.tabBarItem = UITabBarItem(title: "1/2", image: nil, selectedImage: nil)
        
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 20)], for: .normal)

        viewControllers = [miniAppEighthVC, miniAppHalfVC]
    }
}
