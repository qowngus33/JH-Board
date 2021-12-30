//
//  userModel.swift
//  JHBoard
//
//  Created by 배주현 on 2021/12/28.
//

import Foundation
final class UserModel {
    
    struct User {
        var username: String
        var password: String
    }
    
    var model: [User] = [
       User(username: "zico", password: "1234"),
       User(username: "dean", password: "5678"),
       User(username: "penomeco", password: "0101")
    ]
    //user struct로 배엶 만듬
    
    func findUser(name: String, pwd: String) -> Bool {
        for user in model {
            if user.username == name && user.password == pwd {
                return true
            }
        }
        return false
    }
    
    func addUser(name: String, pwd: String) {
        let newUser = User(username: name, password: pwd)
        model.append(newUser)
    }

}
