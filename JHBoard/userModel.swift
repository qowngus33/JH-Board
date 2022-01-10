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
        User(username: "admin", password: "1"),
       User(username: "zico@naver.com", password: "1234"),
       User(username: "dean@naver.com", password: "5678"),
       User(username: "penomeco@naver.com", password: "0101")
    ]
    //user struct로 배열 만듬
    
    func isValidEmail(id: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: id)
        }
        
        // 비밀번호 형식 검사
        func isValidPassword(pwd: String) -> Bool {
            let passwordRegEx = "^[a-zA-Z0-9]{8,}$"
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
            return passwordTest.evaluate(with: pwd)
        }
    
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
