//
//  Extension.swift
//  TodoApp
//
//  Created by hakkı can şengönül on 1.01.2023.
//

import UIKit

extension UIViewController{
    func backgroundGradientColor(){
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemCyan.cgColor, UIColor.systemMint.cgColor]
        gradient.locations = [0,1]
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
    }
}
