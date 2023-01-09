//
//  NewTaskViewController.swift
//  TodoApp
//
//  Created by hakkı can şengönül on 9.01.2023.
//

import UIKit
class NewTaskViewController: UIViewController {
    // MARK: - Properties
    private let newTaskLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSMutableAttributedString(string: "New Task",attributes: [.foregroundColor: UIColor.white, .font: UIFont.preferredFont(forTextStyle: .largeTitle)])
        label.textAlignment = .center
        return label
    }()
    private let textView: InputTextView = {
       let inputTextView = InputTextView()
        inputTextView.placeHolder = "Enter New Task.."
        return inputTextView
    }()
    private let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return button
    }()
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .mainColor
        button.layer.cornerRadius = 10
        return button
    }()
    private var stackView = UIStackView()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
// MARK: - Helpers
extension NewTaskViewController{
    private func style(){
        view.backgroundColor = .black.withAlphaComponent(0.7)
        newTaskLabel.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        stackView = UIStackView(arrangedSubviews: [cancelButton,addButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.distribution = .fillEqually
        
    }
    private func layout(){
        view.addSubview(newTaskLabel)
        view.addSubview(textView)
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            newTaskLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            newTaskLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            view.trailingAnchor.constraint(equalTo: newTaskLabel.trailingAnchor, constant: 32),
            newTaskLabel.heightAnchor.constraint(equalToConstant: 60),
            
            textView.topAnchor.constraint(equalTo: newTaskLabel.bottomAnchor, constant: 8),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: 16),
            textView.heightAnchor.constraint(equalToConstant: view.bounds.height / 5),
            
            stackView.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 16)
        ])
    }
}
