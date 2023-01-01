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
    private lazy var emailContainerView: UIView = {
       let containerView = UIView()
        containerView.backgroundColor = .red
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "envelope")
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(imageView)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            imageView.heightAnchor.constraint(equalToConstant: 26),
            imageView.widthAnchor.constraint(equalToConstant: 26),
            
            emailTextField.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            emailTextField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            containerView.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor)
            
        ])
        return containerView
    }()
    private let emailTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Email"
        textField.textColor = .white
        return textField
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
        emailContainerView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        view.addSubview(logoImageView)
        view.addSubview(emailContainerView)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            
            emailContainerView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8),
            emailContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            view.trailingAnchor.constraint(equalTo: emailContainerView.trailingAnchor, constant: 8),
            emailContainerView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
