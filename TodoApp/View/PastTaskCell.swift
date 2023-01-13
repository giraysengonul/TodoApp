//
//  PastTaskCell.swift
//  TodoApp
//
//  Created by hakkı can şengönül on 13.01.2023.
//

import UIKit
class PastTaskCell: UICollectionViewCell {
    // MARK: - Properties
    private lazy var circleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    private let taskLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.numberOfLines = 0
        label.text = "PastTaskCell"
        label.textColor = .lightGray
        return label
    }()
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Helpers
extension PastTaskCell{
    private func style(){
        backgroundColor = .white
        layer.cornerRadius = 5
        layer.shadowColor = UIColor.black.withAlphaComponent(0.6).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 5
        circleButton.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubview(circleButton)
        addSubview(taskLabel)
        NSLayoutConstraint.activate([
            circleButton.heightAnchor.constraint(equalToConstant: 50),
            circleButton.widthAnchor.constraint(equalToConstant: 50),
            circleButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            circleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            taskLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            taskLabel.leadingAnchor.constraint(equalTo: circleButton.trailingAnchor, constant: 8),
            trailingAnchor.constraint(equalTo: taskLabel.trailingAnchor,constant: 8),
            bottomAnchor.constraint(equalTo: taskLabel.bottomAnchor, constant: 8)
        ])
    }
}
