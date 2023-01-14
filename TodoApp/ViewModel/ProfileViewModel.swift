//
//  ProfileViewModel.swift
//  TodoApp
//
//  Created by hakkı can şengönül on 14.01.2023.
//

import Foundation
struct ProfileViewModel{
    var profileString: String
    init(profileString: String) {
        self.profileString = profileString
    }
    var profileImageUrl: URL?{
        return URL(string: profileString)
    }
}
