//
//  IdViewController.swift
//  easyRegister
//
//  Created by m2comm on 2023/11/13.
//

import Foundation
import UIKit

class IdViewController: UIViewController {
    
    var logoImage: UIImageView!
    var naviBar : UIView!
    
    var joinLabel: UILabel!
    
    var idTF: UITextField!
    var pwTF: UITextField!
    
    var LoginBTN: UIButton!
    
    var infoView: UIView!
    var infoLabel: UILabel!
    var idInfoLabel: UILabel!
    var goLoginBTN: UIButton!
    
    var noInfoView: UIView!
    var noinfoLabel: UILabel!
    var noLabel: UILabel!
    var goJoinBTN: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
        statusBar.backgroundColor = .black
        
        
        self.view.addSubview(statusBar)
        
        naviBar = UIView(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
        naviBar.backgroundColor = .black
        self.view.addSubview(naviBar)
        
        logoImage = UIImageView(frame: CGRect(x: 40, y: 10, width: 100, height: 40))
        logoImage.image = UIImage(named: "Logo")
        naviBar.addSubview(logoImage)
        
        let button = UIButton(type: .custom)
            //Set the image
            button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
            //Set the title
            button.setTitle("", for: .normal)
        button.setTitleColor(.black, for: .normal)
            //Add target
            button.addTarget(self, action: #selector(callMethod), for: .touchUpInside)
            button.frame = CGRect(x: 10, y: 60, width: 100, height: 50)
            button.sizeToFit()

        self.view.addSubview(button)
        
        imageSet()
    }
    
    
    func imageSet() {
        joinLabel = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.2, y: naviBar.frame.maxY + 30, width: 100, height: 40))
        joinLabel.text = "아이디 찾기"
        
        self.view.addSubview(joinLabel)
        
        
        idTF = UITextField(frame: CGRect(x: 60, y: joinLabel.frame.maxY + 20, width: self.view.frame.size.width - 120, height: 70))
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
        LoginBTN.setTitle("찾기", for: .normal)
        LoginBTN.backgroundColor = #colorLiteral(red: 0, green: 0.4743512869, blue: 0.7450370789, alpha: 1)
//        LoginBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        self.view.addSubview(LoginBTN)
        
        
        infoView = UIView(frame: CGRect(x: 60, y: LoginBTN.frame.maxY + 30, width: self.view.frame.size.width - 120, height: 180))
        infoView.backgroundColor = .white
        infoView.layer.cornerRadius = 8
        infoView.layer.borderWidth = 1
        self.view.addSubview(infoView)
        
        infoLabel = UILabel(frame: CGRect(x: 20, y: 20, width: self.view.frame.size.width - 40, height: 30))
        infoLabel.text = "입력 정보와 일치하는 아이디는 아래와 같습니다."
        infoLabel.sizeToFit()
        infoLabel.font = UIFont.systemFont(ofSize: 11)
        
        infoView.addSubview(infoLabel)
        
        idInfoLabel = UILabel(frame: CGRect(x: 40, y: infoLabel.frame.maxY + 20, width: infoView.frame.size.width - 80, height: 45))
        idInfoLabel.backgroundColor = .red
        idInfoLabel.layer.cornerRadius = 8
        idInfoLabel.layer.borderWidth = 1
        idInfoLabel.text = "test"
        idInfoLabel.textAlignment = .center
        idInfoLabel.textColor = .white
        infoView.addSubview(idInfoLabel)
        
        goLoginBTN = UIButton(frame: CGRect(x: 40, y: idInfoLabel.frame.maxY + 10, width: infoView.frame.width - 80, height: 45))
        goLoginBTN.layer.borderWidth = 1
        goLoginBTN.layer.cornerRadius = 8
        goLoginBTN.setTitle("로그인 바로가기", for: .normal)
        goLoginBTN.backgroundColor = #colorLiteral(red: 0.20370996, green: 0.2864174545, blue: 0.4257128537, alpha: 1)
        goLoginBTN.addTarget(self, action: #selector(goLogin(_ :)), for: .touchUpInside)
        infoView.addSubview(goLoginBTN)
        
        
        
        noInfoView = UIView(frame: CGRect(x: 60, y: infoView.frame.maxY + 10, width: self.view.frame.size.width - 120, height: 180))
        noInfoView.backgroundColor = #colorLiteral(red: 0.2431017458, green: 0.2765840292, blue: 0.3526078463, alpha: 1)
        noInfoView.layer.cornerRadius = 8
        noInfoView.layer.borderWidth = 1
        self.view.addSubview(noInfoView)
        
        noinfoLabel = UILabel(frame: CGRect(x: 20, y: 20, width: noInfoView.frame.size.width - 40, height: 35))
        noinfoLabel.text = "입력 정보와 일치하는 계정이 없습니다.\n입력 정보를 다시 확인해주세요."
        noinfoLabel.numberOfLines = 0
        noinfoLabel.font = UIFont.systemFont(ofSize: 14)
        noinfoLabel.textColor = .white
        noinfoLabel.textAlignment = .center
        noInfoView.addSubview(noinfoLabel)
        
        noLabel = UILabel(frame: CGRect(x: 20, y: noinfoLabel.frame.maxY + 10, width: noInfoView.frame.size.width - 40, height: 30))
        noLabel.text = "회원이 아니신가요?"
        noLabel.textColor = .orange
        noLabel.textAlignment = .center
        noInfoView.addSubview(noLabel)
        
        goJoinBTN = UIButton(frame: CGRect(x: 40, y: noLabel.frame.maxY + 10, width: noInfoView.frame.width - 80, height: 45))
        goJoinBTN.setTitle("회원가입 바로가기", for: .normal)
        goJoinBTN.backgroundColor = #colorLiteral(red: 0.2431017458, green: 0.2765840292, blue: 0.3526078463, alpha: 1)
        goJoinBTN.addTarget(self, action: #selector(goJoin(_ :)), for: .touchUpInside)
        goJoinBTN.layer.addBorder([.bottom], color: .white, width: 1)
        noInfoView.addSubview(goJoinBTN)
        
        noInfoView.isHidden = true

        
    }
 
    
    
    

    
    @objc func callMethod(){
        self.dismiss(animated: false)
    }
    
    @objc func goJoin(_ sender: UIButton){
        let validVC = SingUpNormalViewController()
        validVC.modalPresentationStyle = .fullScreen
        present(validVC, animated: false, completion: nil)
    }
    
    @objc func goLogin(_ sender: UIButton){
        let validVC = LoginNoramlViewController()
        validVC.modalPresentationStyle = .fullScreen
        present(validVC, animated: false, completion: nil)
    }
}
