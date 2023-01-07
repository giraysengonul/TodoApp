//
//  MainViewController.swift
//  TodoApp
//
//  Created by hakkı can şengönül on 6.01.2023.
//

import UIKit
import FirebaseAuth
class MainTabBarViewController: UITabBarController {
    // MARK: - Properties
    let pastTaskViewController = PastTaskViewController()
    let tasksViewController = TasksViewController()
    let profileViewController = ProfileViewController()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        userStatus()
        style()
    }
    
}
// MARK: - Helpers
extension MainTabBarViewController{
    private func style(){
        viewControllers = [configureViewController(rootViewController: pastTaskViewController, title: "Past", image: "clock.badge.checkmark"),
                           configureViewController(rootViewController: tasksViewController, title: "Tasks", image: "checkmark.circle"),
                           configureViewController(rootViewController: profileViewController, title: "Profile", image: "person.circle")
        ]
    }
    private func userStatus(){
        if Auth.auth().currentUser?.uid == nil {
            let controller = UINavigationController(rootViewController: LoginViewController())
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true)
        }else{
            print("Kullanıcı Var")
        }
    }
    private func signOut(){
        do{
            try Auth.auth().signOut()
            userStatus()
        }catch{
            
        }
        
    }
    private func configureViewController(rootViewController: UIViewController, title: String, image: String)-> UINavigationController{
        let controller = UINavigationController(rootViewController: rootViewController)
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage(systemName: image)
        return controller
    }
}
