//
//  MainViewController.swift
//  TodoApp
//
//  Created by hakkı can şengönül on 6.01.2023.
//

import UIKit
import FirebaseAuth
class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        userStatus()
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
        }catch{
            
        }
      
    }
}
