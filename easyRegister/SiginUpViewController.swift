//
//  SiginUpViewController.swift
//  easyRegister
//
//  Created by m2comm on 2023/11/04.
//

import Foundation
import UIKit

var joinIdText = ""
var joinPwText = ""

class SiginUpViewController: UIViewController, UITextFieldDelegate {
    
    

    var textField_ID: UITextField = {
      let textField_ID = UITextField()
        textField_ID.placeholder = "아이디를 입력해주세요"
        textField_ID.textColor = .lightGray
        textField_ID.translatesAutoresizingMaskIntoConstraints = false
      return textField_ID
    }()
    
    
    var textField_Password: UITextField = {
      let textField_Password = UITextField()
        textField_Password.placeholder = "비밀번호를 입력해주세요"
        textField_Password.textColor = .lightGray
        textField_Password.translatesAutoresizingMaskIntoConstraints = false
      return textField_Password
    }()
    
    
    
    
    var textField_CheckPassword: UITextField = {
      let textField_CheckPassword = UITextField()
        textField_CheckPassword.placeholder = "비밀번호를 재입력 해주세요"
        textField_CheckPassword.textColor = .lightGray
        textField_CheckPassword.translatesAutoresizingMaskIntoConstraints = false
      return textField_CheckPassword
    }()
    
    
    var nextButton : UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        
        self.view.addSubview(textField_ID)
        
        textField_ID.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        textField_ID.topAnchor.constraint(equalTo: view.topAnchor, constant: 350).isActive = true
        textField_ID.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true

        textField_ID.layer.borderWidth = 0.5
        
        
    
        self.view.addSubview(textField_Password)
        
        textField_Password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        textField_Password.topAnchor.constraint(equalTo: textField_ID.bottomAnchor, constant: 20).isActive = true
        textField_Password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true

        textField_Password.layer.borderWidth = 0.5
        
        
        self.view.addSubview(textField_CheckPassword)
        
        textField_CheckPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        textField_CheckPassword.topAnchor.constraint(equalTo: textField_Password.bottomAnchor, constant: 20).isActive = true
        textField_CheckPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true

        textField_CheckPassword.layer.borderWidth = 0.5
        
        
        
        
        
        nextButton = UIButton(frame: CGRect(x: self.view.frame.size.width / 2.5, y: 550, width: 100, height: 50))
        
        nextButton.setTitle("next", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.layer.borderWidth = 0.5
        nextButton.addTarget(self, action: #selector(test), for: .touchUpInside)


        self.view.addSubview(nextButton)
        
      
        
        
        
        
        
        
        
        self.textField_ID.delegate = self
                self.textField_Password.delegate = self
                self.textField_CheckPassword.delegate = self
            
                //텍스트필드 입력값 변경 감지
                self.textField_ID.addTarget(self, action: #selector(self.TFdidChanged(_:)), for: .editingChanged)
                self.textField_Password.addTarget(self, action: #selector(self.TFdidChanged(_:)), for: .editingChanged)
                self.textField_CheckPassword.addTarget(self, action: #selector(self.TFdidChanged(_:)), for: .editingChanged)
            }
    
    
    
    @objc func test (sender: UIButton) {
        joinIdText = UserDefaults.standard.string(forKey: "id")!
        joinPwText = UserDefaults.standard.string(forKey: "pw")!
        
        //Move to MainPage
        let validVC = LoginViewController()
        validVC.modalPresentationStyle = .fullScreen
        present(validVC, animated: false, completion: nil)
    }
    
    
    
    
    
    
    func isSameBothTextField(_ first: UITextField,_ second: UITextField) -> Bool {
            
            if(first.text == second.text) {
                return true
            } else {
                return false
            }
        }
        
        //텍스트 필드 입력값 변하면 유효성 검사
        @objc func TFdidChanged(_ sender: UITextField) {
            
            print("텍스트 변경 감지")
            print("text :", sender.text)
            
            //3개 텍스트필드가 채워졌는지, 비밀번호가 일치하는 지 확인.
            if !(self.textField_ID.text?.isEmpty ?? true)
                && !(self.textField_Password.text?.isEmpty ?? true)
                && isSameBothTextField(textField_Password, textField_CheckPassword) {
                updateNextButton(willActive: true)
            }
            else {
                
                updateNextButton(willActive: false)
            }
            
        }
        
        //'다음' 버튼 활성화/비활성화
        func updateNextButton(willActive: Bool) {

            if(willActive == true) {
                self.nextButton.isEnabled = true
                //다음 버튼 색 변경
                nextButton.setTitleColor(UIColor.green, for: UIControl.State.normal)
                //다음 페이지 연결
                print("다음 버튼 활성화")
                
                UserDefaults.standard.set(textField_ID.text, forKey: "id")
                UserDefaults.standard.set(textField_CheckPassword.text, forKey: "pw")
                
            } else {
                self.nextButton.isEnabled = false
                //다음 버튼 색 변경
                self.nextButton.setTitleColor(UIColor.red, for: UIControl.State.normal)
                //다음 페이지 연결 해제
                print("다음 버튼 비활성화")
            }
        }
        
//        //취소 버튼 클릭시
//        @IBAction func popToPrev() {
//            self.navigationController?.popViewController(animated: true)
//        }
}
