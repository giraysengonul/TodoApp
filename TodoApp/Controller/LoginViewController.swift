//
//  ViewController.swift
//  TodoApp
//
//  Created by hakkı can şengönül on 31.12.2022.
//

import UIKit

class LoginViewController: UIViewController {
     // MARK: - Properties
    private let logoImageView: UIImageView = {
       let imageView =  UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "checkmark.diamond")
        imageView.tintColor = .white
        return imageView
    }()
     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
 // MARK: - Helpers
extension LoginViewController{
    private func style(){
        backgroundGradientColor()
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.layer.cornerRadius = 150 / 2
    }
    private func layout(){
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
