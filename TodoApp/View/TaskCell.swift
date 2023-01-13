//
//  TasksCell.swift
//  TodoApp
//
//  Created by hakkı can şengönül on 12.01.2023.
//

import UIKit
protocol TaskCellProtocol: AnyObject {
    func deleteTask(sender: TaskCell,index: Int)
}
class TaskCell: UICollectionViewCell {
    // MARK: - Properties
    var index: Int?
    var task: Task?{
        didSet{ configure() }
    }
    weak var delegate: TaskCellProtocol?
    private lazy var circleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.tintColor = .mainColor
        button.addTarget(self, action: #selector(handleCircleButton), for: .touchUpInside)
        return button
    }()
    private let taskLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.numberOfLines = 0
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
// MARK: - Selector
extension TaskCell{
    @objc private func handleCircleButton(_ sender: UIButton){
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.circleButton.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0) {
                self.circleButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
                self.circleButton.alpha = 1
            } completion: { _ in
                guard let task = self.task else { return }
                guard let index = self.index else{ return }
                Service.deleteTask(task: task)
                self.delegate?.deleteTask(sender: self, index: index)
            }
            
        }
        
    }
}
// MARK: - Helpers
extension TaskCell{
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
    private func configure(){
        guard let task = self.task else { return }
        taskLabel.text = task.text
    }
}
