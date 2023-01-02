//
//  RegisterViewModel.swift
//  TodoApp
//
//  Created by hakkı can şengönül on 2.01.2023.
//

import UIKit

struct RegisterViewModel{
    var emailText: String?
    var passwordText: String?
    var nameText: String?
    var usernameText: String?
    
    var status: Bool{
        return emailText?.isEmpty == false && passwordText?.isEmpty == false && nameText?.isEmpty == false && usernameText?.isEmpty == false
    }
}

