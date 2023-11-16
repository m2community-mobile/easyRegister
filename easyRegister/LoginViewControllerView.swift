////
////  LoginViewControllerView.swift
////  easyRegister
////
////  Created by m2comm on 2023/11/04.
//
//
//import Foundation
//import UIKit
//
//class LoginViewControllerView: UIViewController {
//    
//    
//    var userModel = UserModel() // 인스턴스 생성
//    
//    var id: UILabel = {
//      let id = UILabel()
//      id.text = "user_id"
//      id.backgroundColor = .white
//      id.translatesAutoresizingMaskIntoConstraints = false
//      return id
//    }()
//    
//    var idText: UITextField = {
//      let text = UITextField()
//      text.placeholder = " 아이디를 입력해주세요"
//        text.textColor = .lightGray
//      text.translatesAutoresizingMaskIntoConstraints = false
//      return text
//    }()
//    
//    var pw: UILabel = {
//      let pw = UILabel()
//      pw.text = "user_pw"
//      pw.backgroundColor = .white
//      pw.translatesAutoresizingMaskIntoConstraints = false
//      return pw
//    }()
//    
//    var pwText: UITextField = {
//      let pwText = UITextField()
//        pwText.placeholder = " 비밀번호를 입력해주세요"
//        pwText.textColor = .lightGray
//        pwText.translatesAutoresizingMaskIntoConstraints = false
//      return pwText
//    }()
//    
//  
//    
//    
//    
//    
////    var loginButton: UIButton = {
////        let loginButton = UIButton()
////        loginButton.setTitle("login", for: .normal)
////
//////        loginButton.translatesAutoresizingMaskIntoConstraints = false
////        return loginButton
////    }()
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.view.backgroundColor = .white
//        
//    
//        self.view.addSubview(id)
//        
//        id.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
//        id.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 250).isActive = true
//        
//        
//        
//        self.view.addSubview(idText)
//        
//        idText.leadingAnchor.constraint(equalTo: id.leadingAnchor).isActive = true
//        idText.topAnchor.constraint(equalTo: id.bottomAnchor, constant: 10).isActive = true
//        idText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
//        idText.heightAnchor.constraint(equalToConstant: 40).isActive = true
//
//        idText.backgroundColor = .lightGray
//        idText.layer.cornerRadius = 8
//        idText.layer.borderWidth = 0.5
//        
//        
//        
//        self.view.addSubview(pw)
//        
//        pw.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
//        pw.topAnchor.constraint(equalTo: idText.bottomAnchor, constant: 20).isActive = true
//        
//        
//        
//        self.view.addSubview(pwText)
//        
//        pwText.leadingAnchor.constraint(equalTo: pw.leadingAnchor).isActive = true
//        pwText.topAnchor.constraint(equalTo: pw.bottomAnchor, constant: 10).isActive = true
//        pwText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
//        pwText.heightAnchor.constraint(equalToConstant: 40).isActive = true
//
//        
//        pwText.backgroundColor = .lightGray
//        pwText.layer.cornerRadius = 8
//        pwText.layer.borderWidth = 0.5
//     
//        
//        let button = UIButton(frame: CGRect(x: self.view.frame.size.width / 6, y: 500, width: 100, height: 50))
//        
//        button.setTitle("Login", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.layer.borderWidth = 0.5
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//
//        self.view.addSubview(button)
//        
//        
//        let sinupButton = UIButton(frame: CGRect(x: self.view.frame.size.width / 1.7, y: 500, width: 100, height: 50))
//        
//        sinupButton.setTitle("Sin Up", for: .normal)
//        sinupButton.setTitleColor(.black, for: .normal)
//        sinupButton.layer.borderWidth = 0.5
//        sinupButton.addTarget(self, action: #selector(sinup), for: .touchUpInside)
//
//        self.view.addSubview(sinupButton)
//        
//        
//        
//        
//        // 키보드 내리기
//            idText.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
//            pwText.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
//            button.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
//                
//        
//        
//    }
//    
//    // 로그인 method
//    func loginCheck(id: String, pwd: String) -> Bool {
//        for user in userModel.users {
//            if user.id == id && user.pw == pwd {
//                return true // 로그인 성공
//            }
//        }
//        return false
//    }
//    
//    @objc func buttonAction(sender: UIButton!) {
//        
//        if idText.text == joinIdText && pwText.text == joinPwText {
//            print("success")
//            
//            //Move to MainPage
//            let validVC = TabBarController()
//            validVC.modalPresentationStyle = .fullScreen
//            present(validVC, animated: true, completion: nil)
//        }
//       
//        
////        // 옵셔널 바인딩 & 예외 처리 : Textfield가 빈문자열이 아니고, nil이 아닐 때
////            guard let email = idText.text, !email.isEmpty else { return }
////            guard let password = pwText.text, !password.isEmpty else { return }
////
////            if userModel.isValidEmail(id: email){
////                if let removable = self.view.viewWithTag(100) {
////                    removable.removeFromSuperview()
////                }
////            }
////            else {
////                shakeTextField(textField: idText)
////                let emailLabel = UILabel(frame: CGRect(x: 68, y: 350, width: 279, height: 45))
////                emailLabel.text = "이메일 형식을 확인해 주세요"
////                emailLabel.textColor = UIColor.red
////                emailLabel.tag = 100
////
////                self.view.addSubview(emailLabel)
////            } // 이메일 형식 오류
////
////            if userModel.isValidPassword(pwd: password){
////                if let removable = self.view.viewWithTag(101) {
////                    removable.removeFromSuperview()
////                }
////            }
////            else{
////                shakeTextField(textField: pwText)
////                let passwordLabel = UILabel(frame: CGRect(x: 68, y: 435, width: 279, height: 45))
////                passwordLabel.text = "비밀번호 형식을 확인해 주세요"
////                passwordLabel.textColor = UIColor.red
////                passwordLabel.tag = 101
////
////                self.view.addSubview(passwordLabel)
////            } // 비밀번호 형식 오류
////
////            if userModel.isValidEmail(id: email) && userModel.isValidPassword(pwd: password) {
////                let loginSuccess: Bool = loginCheck(id: email, pwd: password)
////                if loginSuccess {
////                    print("로그인 성공")
////                    if let removable = self.view.viewWithTag(102) {
////                        removable.removeFromSuperview()
////                    }
////                    self.performSegue(withIdentifier: "showMain", sender: self)
////                }
////                else {
////                    print("로그인 실패")
////                    shakeTextField(textField: idText)
////                    shakeTextField(textField: pwText)
////                    let loginFailLabel = UILabel(frame: CGRect(x: 68, y: 510, width: 279, height: 45))
////                    loginFailLabel.text = "아이디나 비밀번호가 다릅니다."
////                    loginFailLabel.textColor = UIColor.red
////                    loginFailLabel.tag = 102
////
////                    self.view.addSubview(loginFailLabel)
////                }
////            }
//    }
//    
//    @objc func sinup(sender: UIButton!) {
//        
//        //Move to MainPage
//        let validVC = SiginUpViewController()
//        validVC.modalPresentationStyle = .fullScreen
//        present(validVC, animated: true, completion: nil)
//        
//    }
//    
//    // TextField 흔들기 애니메이션
//    func shakeTextField(textField: UITextField) -> Void{
//        UIView.animate(withDuration: 0.2, animations: {
//            textField.frame.origin.x -= 10
//        }, completion: { _ in
//            UIView.animate(withDuration: 0.2, animations: {
//                textField.frame.origin.x += 20
//             }, completion: { _ in
//                 UIView.animate(withDuration: 0.2, animations: {
//                    textField.frame.origin.x -= 10
//                })
//            })
//        })
//    }
//        
//        
//    // 다음 누르면 입력창 넘어가기, 완료 누르면 키보드 내려가기
//    @objc func didEndOnExit(_ sender: UITextField) {
//        if idText.isFirstResponder {
//            pwText.becomeFirstResponder()
//        }
//    }
//    
//    
//    
//    
//}

