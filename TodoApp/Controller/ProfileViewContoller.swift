//
//  ProfileViewContoller.swift
//  TodoApp
//
//  Created by hakkı can şengönül on 7.01.2023.
//

import UIKit
import SDWebImage
class ProfileViewController: UIViewController {
     // MARK: - Properties
    var user: User?{
        didSet{ configure() }
    }
    private let profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
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
extension ProfileViewController{
    private func style(){
        backgroundGradientColor()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.cornerRadius = 160 / 2
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.borderWidth = 3
    }
    private func layout(){
        view.addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImageView.heightAnchor.constraint(equalToConstant: 160),
            profileImageView.widthAnchor.constraint(equalToConstant: 160),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    private func configure(){
        guard let user = self.user else { return }
        let viewModel = ProfileViewModel(profileString: user.profileImageUrl)
        profileImageView.sd_setImage(with: viewModel.profileImageUrl)
    }
}
