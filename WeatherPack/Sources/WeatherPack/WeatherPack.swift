// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit

public class ResizableLabelViewController: UIViewController {

    private var label = UILabel()

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        // Настройка label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0

        view.addSubview(label)
        
        // Добавляем Constraints для label, чтобы он мог центрироваться по X и Y
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, constant: -20),
            label.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, constant: -20)
        ])
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // Рассчитываем соотношение ширины и высоты
        let width = view.bounds.width
        let height = view.bounds.height
        let aspectRatio = height / width

        // Изменяем положение и размер шрифта в зависимости от соотношения
        if aspectRatio < 0.25 {
            // Если высота в 4 раза меньше ширины, размещаем слева
            label.textAlignment = .left
            label.font = UIFont.systemFont(ofSize: 16)
        } else if aspectRatio >= 0.25 && aspectRatio <= 1.0 {
            // Если высота равна ширине (1:1), размещаем в центре, с мелким шрифтом
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 16)
        } else {
            // Если высота больше ширины, размещаем в центре с крупным шрифтом
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 24)
        }
    }

    // Метод для обновления текста в label
    public func updateLabel(text: String) {
        label.text = text
    }
}
