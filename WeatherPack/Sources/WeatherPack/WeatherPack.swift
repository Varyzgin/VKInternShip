// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit
import WeatherKit

public class ResizableLabelViewController: UIViewController {
    
    private var label = UILabel()
    private var count = 0
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        updateLabel(text: "0")
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, constant: -20),
            label.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, constant: -20)
        ])
    }
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let width = view.bounds.width
        let height = view.bounds.height
        let aspectRatio = height / width
        
        // Изменяем положение и размер шрифта в зависимости от соотношения
        if aspectRatio < 0.25 {
            // Если высота в 4 раза меньше ширины, размещаем слева
            label.textAlignment = .left
            label.font = UIFont.systemFont(ofSize: 18)
        } else if aspectRatio >= 0.25 && aspectRatio <= 1.0 {
            // Если высота равна ширине (1:1), размещаем в центре, с мелким шрифтом
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 24)
            // Создаем кнопку
            let buttonPlus = UIButton(type: .system)
            buttonPlus.setTitle("+", for: .normal)
            buttonPlus.frame = CGRect(x: 100, y: 100, width: 150, height: 50)
            buttonPlus.addTarget(self, action: #selector(plusOne), for: .touchUpInside)
            view.addSubview(buttonPlus)
            
            let buttonMinus = UIButton(type: .system)
            buttonMinus.setTitle("-", for: .normal)
            buttonMinus.frame = CGRect(x: 200, y: 200, width: 250, height: 150)
            buttonMinus.addTarget(self, action: #selector(minusOne), for: .touchUpInside)
            view.addSubview(buttonMinus)
            
            let buttonOpen = UIButton(type: .system)
            buttonOpen.setTitle("Open", for: .normal)
            buttonOpen.frame = CGRect(x: 200, y: 100, width: 250, height: 150)
            buttonOpen.addTarget(self, action: #selector(fullView), for: .touchUpInside)
            view.addSubview(buttonOpen)
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                
                buttonPlus.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                buttonPlus.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
                
                buttonMinus.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                buttonMinus.topAnchor.constraint(equalTo: buttonPlus.bottomAnchor, constant: 20),
                
                buttonOpen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                buttonOpen.topAnchor.constraint(equalTo: buttonMinus.bottomAnchor, constant: 20)
            ])
        } else {
            // Если высота больше ширины, размещаем в центре с крупным шрифтом
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 30)
        }
    }
    
    @objc func plusOne() {
        count += 1
        updateLabel(text: "\(count)")
    }
    @objc func minusOne() {
        count -= 1
        updateLabel(text: "\(count)")
    }
    @objc func fullView() {
        // Создаем экземпляр MyTableViewController
        let fullScreenVC = ResizableLabelViewController() // Создаем новый экземпляр
        fullScreenVC.count = self.count // Передаем текущее состояние (счетчик)
        fullScreenVC.modalPresentationStyle = .fullScreen // Устанавливаем полное экранное отображение
        present(fullScreenVC, animated: true, completion: nil)
    }
    public func updateLabel(text: String) {
        label.text = text
    }
}
