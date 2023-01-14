//
//  CustomProfileView.swift
//  TodoApp
//
//  Created by hakkı can şengönül on 14.01.2023.
//

import UIKit
class CustomProfileView: UIView {
    init(label: UILabel) {
        super.init(frame: .zero)
        layer.borderWidth = 1.7
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius  = 10
        let label = label
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
