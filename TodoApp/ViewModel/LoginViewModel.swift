//
//  LoginViewModel.swift
//  TodoApp
//
//  Created by hakkı can şengönül on 1.01.2023.
//

import UIKit

struct LoginViewModel{
    var emailText: String?
    var passwordText: String?
    
    var status: Bool{
        return emailText?.isEmpty == false && passwordText?.isEmpty == false
    }
}
