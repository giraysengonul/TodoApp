//
//  PastTaskViewController.swift
//  TodoApp
//
//  Created by hakkı can şengönül on 7.01.2023.
//

import UIKit
private let reuseIdentifier = "PastTaskCell"
class PastTaskViewController: UIViewController {
    // MARK: - Properties
    var user: User?{
        didSet{ configureUser() }
    }
    private var pastTasks: [Task]?{
        didSet{ self.collectionView.reloadData() }
    }
    private let collectionView:UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return collectionView
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
 // MARK: - Service
extension PastTaskViewController{
    private func fetchTasks(uid: String){
        Service.fetchPastTasks(uid: uid) { tasks in
            self.pastTasks = tasks
        }
    }
}
// MARK: - Helpers
extension PastTaskViewController{
    private func style(){
        backgroundGradientColor()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PastTaskCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = .clear
    }
    private func layout(){
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 14)
        ])
    }
    private func configureUser(){
        guard let user = self.user else { return }
        fetchTasks(uid: user.uid)
    }
}
// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension PastTaskViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pastTasks?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PastTaskCell
        cell.task = self.pastTasks?[indexPath.row]
        return cell
    }
}
 // MARK: - UICollectionViewDelegateFlowLayout
extension PastTaskViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = PastTaskCell(frame: .init(x: 0, y: 0, width: view.frame.width * 0.9, height: 50))
        cell.task = pastTasks![indexPath.row]
        cell.layoutIfNeeded()
        let copySize = cell.systemLayoutSizeFitting(.init(width: view.frame.width * 0.9, height: 1000))
        return .init(width: view.frame.width * 0.9, height: copySize.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: 10, height: 10)
    }
}
