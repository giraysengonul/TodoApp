//
//  TasksViewController.swift
//  TodoApp
//
//  Created by hakkı can şengönül on 7.01.2023.
//

import UIKit

class TasksViewController: UIViewController {
    // MARK: - Properties
    private let newTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.diamond.fill"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.tintColor = .white
        return button
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
// MARK: - Helpers
extension TasksViewController{
    private func style(){
        backgroundGradientColor()
        newTaskButton.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        view.addSubview(newTaskButton)
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: newTaskButton.bottomAnchor, constant: 30),
            view.trailingAnchor.constraint(equalTo: newTaskButton.trailingAnchor, constant: 4),
            newTaskButton.heightAnchor.constraint(equalToConstant: 60),
            newTaskButton.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
}
