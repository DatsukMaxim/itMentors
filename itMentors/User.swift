//
//  User.swift
//  itMentors
//
//  Created by alexkarav on 28.07.2022.
//

import Foundation


struct User {
    let login: String
    let password: String
    
    static func getUser() -> User {
        User(
            login: "User",
            password: "Password"
        )
    }
}
