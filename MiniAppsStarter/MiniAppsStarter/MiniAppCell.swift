//
//  MiniAppCell.swift
//  MiniAppsStarter
//
//  Created by Дима on 9/6/24.
//

import UIKit

class MiniAppTableViewCell: UITableViewCell {

    // Контейнер для мини-приложения
    let miniAppContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        contentView.addSubview(miniAppContainer)

        NSLayoutConstraint.activate([
            miniAppContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1),
            miniAppContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1),
            miniAppContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 1),
            miniAppContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1)
        ])
    }
}
