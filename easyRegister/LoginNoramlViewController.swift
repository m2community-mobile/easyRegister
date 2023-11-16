//
//  LoginNoramlViewController.swift
//  easyRegister
//
//  Created by m2comm on 2023/11/09.
//

import Foundation
import UIKit

var test = ""

class LoginNoramlViewController: UIViewController {
    
    var naviBar : UIView!
    
    var loginLabel: UILabel!
    
    var idTF: UITextField!
    var pwTF: UITextField!
    
    var LoginBTN: UIButton!
    
    var findIdBTN: UIButton!
    var findPwBTN: UIButton!
    
    
    var showLabel: UILabel!
    
    var joinBTN: UIButton!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
        statusBar.backgroundColor = mainColor
        
        self.view.addSubview(statusBar)
        
        naviBar = UIView(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
        naviBar.backgroundColor = .white
        self.view.addSubview(naviBar)
        
        
        setImage()
    }
    
    
    
    func setImage() {
        loginLabel = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.2, y: naviBar.frame.maxY + 40, width: 100, height: 50))
        loginLabel.text = "로그인"
        
        self.view.addSubview(loginLabel)
        
        idTF = UITextField(frame: CGRect(x: 60, y: loginLabel.frame.maxY + 20, width: self.view.frame.size.width - 120, height: 70))
        idTF.placeholder = " ID"
//        idTF.layer.borderWidth = 1
        idTF.layer.cornerRadius = 8
        idTF.layer.addBorder([.bottom], color: .lightGray, width: 1)
        self.view.addSubview(idTF)
        
        pwTF = UITextField(frame: CGRect(x: 60, y: idTF.frame.maxY, width: self.view.frame.size.width - 120, height: 70))
        pwTF.placeholder = " PW"
//        pwTF.layer.borderWidth = 1
        pwTF.layer.cornerRadius = 8
        self.view.addSubview(pwTF)
        
        LoginBTN = UIButton(frame: CGRect(x: 60, y: pwTF.frame.maxY + 20, width: self.view.frame.width - 120, height: 50))
        LoginBTN.layer.borderWidth = 1
        LoginBTN.layer.cornerRadius = 8
        LoginBTN.setTitle("LOGIN", for: .normal)
        LoginBTN.backgroundColor = #colorLiteral(red: 0, green: 0.4743512869, blue: 0.7450370789, alpha: 1)
        LoginBTN.addTarget(self, action: #selector(login(_ :)), for: .touchUpInside)
        self.view.addSubview(LoginBTN)
        
        findIdBTN = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 70))
        findIdBTN.setTitle(" 아이디 찾기", for: .normal)
        findIdBTN.backgroundColor = .white
        findIdBTN.setTitleColor(.blue, for: .normal)
        findIdBTN.contentHorizontalAlignment = .center
        findIdBTN.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        findIdBTN.setImage(UIImage(named: "id"), for: .normal)
        findIdBTN.addTarget(self, action: #selector(findID(_ :)), for: .touchUpInside)
        
        findPwBTN = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 70))
        findPwBTN.setTitle(" 비밀번호 찾기", for: .normal)
        findPwBTN.backgroundColor = .white
        findPwBTN.setTitleColor(.blue, for: .normal)
        findPwBTN.contentHorizontalAlignment = .center
        findPwBTN.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        findPwBTN.setImage(UIImage(named: "pw"), for: .normal)
//        LoginBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        
        let stack : UIStackView
        stack = UIStackView(frame: CGRect(x: 60, y: LoginBTN.frame.maxY + 20, width: self.view.frame.size.width - 120, height: 50))
        stack.layer.borderWidth = 1
        stack.layer.cornerRadius = 8
        stack.axis = .horizontal
        stack.spacing = 2
        stack.distribution = .equalCentering
        stack.alignment = .center
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 45, bottom: 0, right: 45)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.addArrangedSubview(findIdBTN)
        stack.addArrangedSubview(findPwBTN)
        
        
        stack.isUserInteractionEnabled = true
        
        self.view.addSubview(stack)
        
        
        
        showLabel = UILabel(frame: CGRect(x: 60, y: stack.frame.maxY + 40, width: self.view.frame.size.width - 120, height: 50))
        showLabel.numberOfLines = 0
        showLabel.textAlignment = .center
        showLabel.text = "회원이 아니신가요? \n Easy Register에 가입하여 행사를 생성해보세요!"
        showLabel.adjustsFontSizeToFitWidth = true
        self.view.addSubview(showLabel)
        
        joinBTN = UIButton(frame: CGRect(x: 60, y: showLabel.frame.maxY + 20, width: self.view.frame.width - 120, height: 50))
        joinBTN.layer.borderWidth = 1
        joinBTN.layer.cornerRadius = 8
        joinBTN.setTitle("회원가입 바로가기", for: .normal)
        joinBTN.backgroundColor = #colorLiteral(red: 0.2126621008, green: 0.2807677984, blue: 0.7165837884, alpha: 1)
        joinBTN.addTarget(self, action: #selector(join(_ :)), for: .touchUpInside)
        self.view.addSubview(joinBTN)
        
        
        
    }
    @objc func login(_ sender: UIButton) {
        let validVC = TabBarController()
        validVC.modalPresentationStyle = .fullScreen
        present(validVC, animated: false, completion: nil)
    }
    
    @objc func findID(_ sender: UIButton) {
        let validVC = IdViewController()
        validVC.modalPresentationStyle = .fullScreen
        present(validVC, animated: false, completion: nil)
    }
    
    @objc func join(_ sender: UIButton) {
        let validVC = SingUpNormalViewController()
        validVC.modalPresentationStyle = .fullScreen
        present(validVC, animated: false, completion: nil)
    }
    
    
}
