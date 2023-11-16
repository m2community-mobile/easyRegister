//
//  MyPageViewController.swift
//  easyRegister
//
//  Created by m2comm on 2023/11/09.
//

import Foundation
import UIKit

class MyPageViewController: UIViewController {
    
    var logoImage: UIImageView!
    var setBtn: UIButton!
//    var loginView: UIImageView!
//
//    var loginLabel: UILabel!
    
    var joinBtn: UIButton!
    var heartBtn: UIButton!
    var quesntBtn: UIButton!
    
    var naviBar : UILabel!
    var naviBarText = "                 정보."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        navigationController?.navigationBar.isHidden = true

        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
        statusBar.backgroundColor = #colorLiteral(red: 0.09398979694, green: 0.1242018715, blue: 0.1749066114, alpha: 1)
        
        self.view.addSubview(statusBar)
        
        naviBar = UILabel(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
        naviBar.backgroundColor = #colorLiteral(red: 0.09398979694, green: 0.1242018715, blue: 0.1749066114, alpha: 1)
        
        naviBar.text = naviBarText
        naviBar.textColor = .white
        self.view.addSubview(naviBar)
 
        naviBar.layer.addBorder([.bottom], color: .black, width: 1)
        
        
      imageSet()
    }
    
    func imageSet() {
        
        logoImage = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        logoImage.image = UIImage(named: "loginImage")
        naviBar.addSubview(logoImage)
        
        
        setBtn = UIButton(frame: CGRect(x: self.view.frame.size.width - 40, y: 50, width: 40, height: 40))
        
        setBtn.setImage(UIImage(named: "setting"), for: .normal)
        setBtn.setTitleColor(.white, for: .normal)
        setBtn.layer.cornerRadius = 8
        setBtn.layer.borderWidth = 1
        setBtn.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        
        
        self.view.addSubview(setBtn)
        
//        loginView = UIImageView(frame: CGRect(x: self.view.frame.width / 2.2, y: naviBar.frame.maxY + 70, width: 50, height: 50))
//        loginView.image = UIImage(named: "loginView")
//        self.view.addSubview(loginView)
//
//        loginLabel = UILabel(frame: CGRect(x: 40, y: loginView.frame.maxY + 20, width: self.view.frame.width - 80, height: 40))
//        loginLabel.text = " 회원 메뉴는 로그인한 상태에서만 확인 가능합니다."
//        loginLabel.sizeToFit()
//
//        self.view.addSubview(loginLabel)
        
        
        joinBtn = UIButton(frame: CGRect(x: 40, y: naviBar.frame.maxY + 50, width: self.view.frame.width - 80, height: 70))
        joinBtn.setTitle("신청 행사 목록", for: .normal)
        joinBtn.backgroundColor = #colorLiteral(red: 0.3840324879, green: 0.4296667874, blue: 0.5016573071, alpha: 1)

        joinBtn.layer.cornerRadius = 8
        joinBtn.layer.borderWidth = 1

        joinBtn.addTarget(self, action: #selector(goJoinEvent(_ :)), for: .touchUpInside)
        self.view.addSubview(joinBtn)
        
        
        heartBtn = UIButton(frame: CGRect(x: 40, y: joinBtn.frame.maxY + 20, width: self.view.frame.width - 80, height: 70))
        heartBtn.setTitle("관심 있는 생사", for: .normal)
        heartBtn.backgroundColor = #colorLiteral(red: 0.901861608, green: 0.9170868397, blue: 0.9425587654, alpha: 1)

        heartBtn.layer.cornerRadius = 8
        heartBtn.layer.borderWidth = 1
//        heartBtn.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        
        self.view.addSubview(heartBtn)
        
        
        quesntBtn = UIButton(frame: CGRect(x: 40, y: heartBtn.frame.maxY + 20, width: self.view.frame.width - 80, height: 70))
        quesntBtn.setTitle("나의 문의 내역", for: .normal)
        quesntBtn.backgroundColor = #colorLiteral(red: 0.3840324879, green: 0.4296667874, blue: 0.5016573071, alpha: 1)

        quesntBtn.layer.cornerRadius = 8
        quesntBtn.layer.borderWidth = 1
        
        self.view.addSubview(quesntBtn)
    }
    
    @objc func goJoinEvent(_ sender: UIButton) {
        let vc = JoinEventViewController()
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
        
    }
    
    
    @objc func test(_ sender: UIButton) {
        let vc = SettingViewController()
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
}
