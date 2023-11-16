//
//  UserModel.swift
//  easyRegister
//
//  Created by m2comm on 2023/11/04.
//

import Foundation

final class UserModel {
    struct User {
        var id: String
        var pw: String
    }
    
    var users: [User] = [
        User(id: "abc1234@naver.com", pw: "qwerty1234"),
        User(id: "dazzlynnnn@gmail.com", pw: "asdfasdf5678")
    ]
    
    // 아이디 형식 검사
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
} // end of UserModel
