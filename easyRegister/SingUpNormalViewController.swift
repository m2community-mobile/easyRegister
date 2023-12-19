//
//  SingUpNormalViewController.swift
//  easyRegister
//
//  Created by m2comm on 2023/11/10.
//

import Foundation
import UIKit




class SingUpNormalViewController: UIViewController {
    
    var logoImage: UIImageView!
    
    var selected = true
    let labelOne: UILabel = {
        let label = UILabel()
        label.text = "Scroll Top"
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelTwo: UILabel = {
        let label = UILabel()
        label.text = ""
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    
    
    var naviBar : UIView!
    
    var joinLabel: UILabel!
    
    var nameLabel: UILabel!
    var nameTf: UITextField!
    
    var idLabel: UILabel!
    var pwLabel: UILabel!
    
    var sexLabel: UILabel!
    
    var womanBTN: UIButton!
    var menBTN: UIButton!
    
    var arrBTN: [UIButton]!
    
    var addressLabel: UILabel!
    var getAddressLabel: UILabel!
    var detailAddressTF: UITextField!
    
    var photoLabel: UILabel!
    var photoImage: UIImageView!
    var photoBTN: UIButton!
    
    var mailLabel: UILabel!
    var agreeMailBTN: UIButton!
    var deAgreeMainBTN: UIButton!
    var mailBTN: UIButton!
    
    var mailArrBTN: [UIButton]!
    
    var idTF: UITextField!
    var pwTF: UITextField!
    
    var LoginBTN: UIButton!
    
    var findAdressBTN: UIButton!
    
    var phoneNum: UILabel!
    var phoneNum1: UIButton!
    var phoneNum2: UITextField!
    var phoneNum3: UITextField!
    
    var joinInitBTN: UIButton!
    var joinBTN: UIButton!
    
    
    
    
    
    var findIdBTN: UIButton!
    var findPwBTN: UIButton!
    
    
    var showLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        scrollView.backgroundColor = .white
        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
        statusBar.backgroundColor = .black
        
        
        self.view.addSubview(statusBar)
        
        naviBar = UIView(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
        naviBar.backgroundColor = .black
        self.view.addSubview(naviBar)
        
        
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
        
        logoImage = UIImageView(frame: CGRect(x: 40, y: 10, width: 100, height: 40))
        logoImage.image = UIImage(named: "Logo")
        naviBar.addSubview(logoImage)
        
        scrollView.isExclusiveTouch = false
        scrollView.delaysContentTouches = false
        
        imageSet()
    }
    
    func imageSet() {
        
        self.view.addSubview(scrollView)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: naviBar.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        
//                  scrollView.addSubview(labelOne)
//
//                  labelOne.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
//                  labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true
        
        scrollView.addSubview(labelTwo)
        labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1500).isActive = true
        labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
        
        
        joinLabel = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.2, y: scrollView.frame.minY + 30, width: 100, height: 40))
        joinLabel.text = "회원가입"
        
        scrollView.addSubview(joinLabel)
        
        nameLabel = UILabel(frame: CGRect(x: 60, y: joinLabel.frame.maxY + 20, width: self.view.frame.size.width - 120, height: 40))
        nameLabel.text = "이름"
        scrollView.addSubview(nameLabel)
        
        nameTf = UITextField(frame: CGRect(x: 60, y: nameLabel.frame.maxY + 5, width: self.view.frame.size.width - 120, height: 40))
        nameTf.placeholder = ""
        nameTf.layer.borderWidth = 1
        nameTf.layer.cornerRadius = 8
        
        
        
        
        //        nameTf.layer.addBorder([.bottom], color: .lightGray, width: 1)
        scrollView.addSubview(nameTf)
        
        let nameUnderBar = UIView(frame: CGRect(x: 60, y: nameTf.frame.maxY + 20, width: SCREEN.WIDTH - 120, height: 0.5))
        nameUnderBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.8)
        scrollView.addSubview(nameUnderBar)
        
        
        idLabel = UILabel(frame: CGRect(x: 60, y: nameUnderBar.frame.maxY + 3, width: self.view.frame.size.width - 120, height: 40))
        idLabel.text = "아이디"
        scrollView.addSubview(idLabel)
        
        idTF = UITextField(frame: CGRect(x: 60, y: idLabel.frame.maxY + 5, width: self.view.frame.size.width - 120, height: 40))
        idTF.placeholder = ""
        idTF.layer.borderWidth = 1
        idTF.layer.cornerRadius = 8
        //        nameTf.layer.addBorder([.bottom], color: .lightGray, width: 1)
        scrollView.addSubview(idTF)
        
        let idUnderBar = UIView(frame: CGRect(x: 60, y: idTF.frame.maxY + 20, width: SCREEN.WIDTH - 120, height: 0.5))
        idUnderBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.8)
        scrollView.addSubview(idUnderBar)
        
        
        sexLabel = UILabel(frame: CGRect(x: 60, y: idUnderBar.frame.maxY + 3, width: self.view.frame.size.width - 120, height: 40))
        sexLabel.text = "성별"
        scrollView.addSubview(sexLabel)
        
        
        womanBTN = UIButton(frame: CGRect(x: 60, y: sexLabel.frame.maxY, width: 50, height: 20))
        womanBTN.setTitle(" 여성", for: .normal)
        womanBTN.backgroundColor = .white
        womanBTN.setTitleColor(.blue, for: .normal)
        womanBTN.contentHorizontalAlignment = .center
        womanBTN.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        womanBTN.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        womanBTN.tag = 0
        
        //        womanBTN.setImage(UIImage(named: "id"), for: .normal)
//        womanBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        scrollView.addSubview(womanBTN)
        
        
        menBTN = UIButton(frame: CGRect(x: womanBTN.frame.maxX + 5, y: sexLabel.frame.maxY, width: 50, height: 20))
        menBTN.setTitle(" 남성", for: .normal)
        menBTN.backgroundColor = .white
        menBTN.setTitleColor(.blue, for: .normal)
        menBTN.contentHorizontalAlignment = .center
        menBTN.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        menBTN.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        menBTN.tag = 1
        
        //        womanBTN.setImage(UIImage(named: "id"), for: .normal)
//        menBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        scrollView.addSubview(menBTN)
        
        arrBTN = [womanBTN, menBTN]
        
        self.arrBTN.forEach {
            $0.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        }
        
        let sexUnderBar = UIView(frame: CGRect(x: 60, y: arrBTN[0].frame.maxY + 20, width: SCREEN.WIDTH - 120, height: 0.5))
        sexUnderBar.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1).withAlphaComponent(0.8)
        scrollView.addSubview(sexUnderBar)
        
        addressLabel = UILabel(frame: CGRect(x: 60, y: sexUnderBar.frame.maxY + 3, width: self.view.frame.size.width - 120, height: 40))
        addressLabel.text = "주소"
        scrollView.addSubview(addressLabel)
        
        getAddressLabel = UILabel(frame: CGRect(x: 60, y: addressLabel.frame.maxY + 5, width: self.view.frame.size.width - 120, height: 40))
        getAddressLabel.backgroundColor = .white
        getAddressLabel.layer.borderWidth = 1
        getAddressLabel.layer.cornerRadius = 8
        getAddressLabel.text = ""
        getAddressLabel.isUserInteractionEnabled = true
        scrollView.addSubview(getAddressLabel)
        
        
        findAdressBTN = UIButton(frame: CGRect(x: getAddressLabel.frame.maxX - 150, y: 0, width: getAddressLabel.frame.size.width - getAddressLabel.frame.maxX + 150, height: 40))
        findAdressBTN.setTitle("주소찾기", for: .normal)
        findAdressBTN.setTitleColor(.white, for: .normal)
        findAdressBTN.backgroundColor = .black
        findAdressBTN.layer.borderWidth = 1
        findAdressBTN.layer.cornerRadius = 8
        findAdressBTN.contentHorizontalAlignment = .center
        findAdressBTN.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        findAdressBTN.addTarget(self, action: #selector(testo(_ :)), for: .touchUpInside)
        findAdressBTN.isUserInteractionEnabled = true
        getAddressLabel.addSubview(findAdressBTN)
        
        getAddressLabel = UILabel(frame: CGRect(x: 60, y: getAddressLabel.frame.maxY + 5, width: self.view.frame.size.width - 120, height: 40))
        getAddressLabel.backgroundColor = .white
        getAddressLabel.layer.borderWidth = 1
        getAddressLabel.layer.cornerRadius = 8
        getAddressLabel.text = " 도로명 주소"
        getAddressLabel.textColor = .lightGray
        scrollView.addSubview(getAddressLabel)
        
        detailAddressTF = UITextField(frame: CGRect(x: 60, y: getAddressLabel.frame.maxY + 5, width: self.view.frame.size.width - 120, height: 40))
        detailAddressTF.placeholder = " 상세 주소를 입력해주세요."
        detailAddressTF.layer.borderWidth = 1
        detailAddressTF.layer.cornerRadius = 8
        //        nameTf.layer.addBorder([.bottom], color: .lightGray, width: 1)
        scrollView.addSubview(detailAddressTF)
        
        let addressUnderBar = UIView(frame: CGRect(x: 60, y: detailAddressTF.frame.maxY + 20, width: SCREEN.WIDTH - 120, height: 0.5))
        addressUnderBar.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1).withAlphaComponent(0.8)
        scrollView.addSubview(addressUnderBar)
        
        
        phoneNum = UILabel(frame: CGRect(x: 60, y: addressUnderBar.frame.maxY + 3, width: self.view.frame.size.width - 120, height: 40))
        phoneNum.text = "전화번호"
        scrollView.addSubview(phoneNum)
        
        phoneNum1 = UIButton(frame: CGRect(x: self.view.frame.size.width / 5.5, y: phoneNum.frame.maxY + 20, width: 70, height: 40))
        phoneNum1.setTitle("010", for: .normal)
        phoneNum1.setTitleColor(.black, for: .normal)
        phoneNum1.backgroundColor = .white
        phoneNum1.layer.borderWidth = 1
        phoneNum1.layer.cornerRadius = 8
        phoneNum1.contentHorizontalAlignment = .center
        phoneNum1.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        phoneNum1.addTarget(self, action: #selector(testo(_ :)), for: .touchUpInside)
        phoneNum1.isUserInteractionEnabled = true
        scrollView.addSubview(phoneNum1)
        
        phoneNum2 = UITextField(frame: CGRect(x: self.view.frame.size.width / 2.5, y: phoneNum.frame.maxY + 20, width: 70, height: 40))
        phoneNum2.backgroundColor = .white
        phoneNum2.layer.borderWidth = 1
        phoneNum2.layer.cornerRadius = 8
        phoneNum2.contentHorizontalAlignment = .center
//        phoneNum2.isUserInteractionEnabled = true
        scrollView.addSubview(phoneNum2)
        
        phoneNum3 = UITextField(frame: CGRect(x: self.view.frame.size.width / 1.6, y: phoneNum.frame.maxY + 20, width: 70, height: 40))
        phoneNum3.backgroundColor = .white
        phoneNum3.layer.borderWidth = 1
        phoneNum3.layer.cornerRadius = 8
        phoneNum3.contentHorizontalAlignment = .center
//        phoneNum3.isUserInteractionEnabled = true
        scrollView.addSubview(phoneNum3)
        
        let phoneUnderBar = UIView(frame: CGRect(x: 60, y: phoneNum3.frame.maxY + 20, width: SCREEN.WIDTH - 120, height: 0.5))
        phoneUnderBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.8)
        scrollView.addSubview(phoneUnderBar)
        
        
        
        photoLabel = UILabel(frame: CGRect(x: 60, y: phoneUnderBar.frame.maxY + 3, width: self.view.frame.size.width - 120, height: 40))
        photoLabel.text = "프로필 사진"
        scrollView.addSubview(photoLabel)
        
        photoImage = UIImageView(frame: CGRect(x: 60, y: photoLabel.frame.maxY + 20, width: 100, height: 150))
        photoImage.backgroundColor = .white
        photoImage.layer.borderWidth = 1
        photoImage.layer.cornerRadius = 8
    
        scrollView.addSubview(photoImage)
        
        
        photoBTN = UIButton(frame: CGRect(x: photoImage.frame.maxX + 20, y: photoImage.frame.maxY - 30, width: 100, height: 30))
        photoBTN.setTitle("파일 찾기", for: .normal)
        photoBTN.setTitleColor(.white, for: .normal)
        photoBTN.backgroundColor = .black
        photoBTN.layer.borderWidth = 1
        photoBTN.layer.cornerRadius = 8
        photoBTN.contentHorizontalAlignment = .center
        photoBTN.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        photoBTN.addTarget(self, action: #selector(testo(_ :)), for: .touchUpInside)
        photoBTN.isUserInteractionEnabled = true
        scrollView.addSubview(photoBTN)
        
        
        let photoUnderBar = UIView(frame: CGRect(x: 60, y: photoImage.frame.maxY + 20, width: SCREEN.WIDTH - 120, height: 0.5))
        photoUnderBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.8)
        scrollView.addSubview(photoUnderBar)
     
        
        
        mailLabel = UILabel(frame: CGRect(x: 60, y: photoUnderBar.frame.maxY + 3, width: self.view.frame.size.width - 120, height: 40))
        mailLabel.text = "메일 수신 동의"
        scrollView.addSubview(mailLabel)
        
        
        agreeMailBTN = UIButton(frame: CGRect(x: 60, y: mailLabel.frame.maxY, width: 60, height: 20))
        agreeMailBTN.setTitle(" 동의", for: .normal)
        agreeMailBTN.backgroundColor = .white
        agreeMailBTN.setTitleColor(.blue, for: .normal)
        agreeMailBTN.contentHorizontalAlignment = .center
        agreeMailBTN.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        agreeMailBTN.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        agreeMailBTN.tag = 0
        
        //        womanBTN.setImage(UIImage(named: "id"), for: .normal)
//        womanBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        scrollView.addSubview(agreeMailBTN)
        
        
        deAgreeMainBTN = UIButton(frame: CGRect(x: agreeMailBTN.frame.maxX + 5, y: mailLabel.frame.maxY, width: 60, height: 20))
        deAgreeMainBTN.setTitle(" 미동의", for: .normal)
        deAgreeMainBTN.backgroundColor = .white
        deAgreeMainBTN.setTitleColor(.blue, for: .normal)
        deAgreeMainBTN.contentHorizontalAlignment = .center
        deAgreeMainBTN.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        deAgreeMainBTN.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        deAgreeMainBTN.tag = 1
        
        //        womanBTN.setImage(UIImage(named: "id"), for: .normal)
//        menBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        scrollView.addSubview(deAgreeMainBTN)
        
        mailArrBTN = [agreeMailBTN, deAgreeMainBTN]
        
        self.mailArrBTN.forEach {
            $0.addTarget(self, action: #selector(mailTest(_ :)), for: .touchUpInside)
        }
        
        mailLabel = UILabel(frame: CGRect(x: 60, y: deAgreeMainBTN.frame.maxY + 5, width: self.view.frame.size.width - 120, height: 40))
        mailLabel.text = "* Easy Register에서 발송하는 메일을 수신합니다."
        mailLabel.textColor = .lightGray
        mailLabel.font = UIFont.systemFont(ofSize: 13)
        scrollView.addSubview(mailLabel)
        
        mailBTN = UIButton(frame: CGRect(x: 60, y: mailLabel.frame.maxY, width: self.view.frame.size.width - 120, height: 40))
        mailBTN.setTitle(" 개인정보 수집 동의", for: .normal)
        mailBTN.backgroundColor = .lightGray
        mailBTN.setTitleColor(.black, for: .normal)
        mailBTN.contentHorizontalAlignment = .center
        mailBTN.layer.borderWidth = 1
        mailBTN.layer.cornerRadius = 8
        mailBTN.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        mailBTN.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        mailBTN.addTarget(self, action: #selector(mail(_ :)), for: .touchUpInside)
        
        scrollView.addSubview(mailBTN)
        
        
        let mailUnderBar = UIView(frame: CGRect(x: 60, y: mailBTN.frame.maxY + 20, width: SCREEN.WIDTH - 120, height: 0.5))
        mailUnderBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.8)
        scrollView.addSubview(mailUnderBar)
        
        
        joinInitBTN = UIButton(frame: CGRect(x: 60, y: mailUnderBar.frame.maxY + 20, width: self.view.frame.size.width - 120, height: 40))
        joinInitBTN.setTitle("입력내용 초기화", for: .normal)
        joinInitBTN.setTitleColor(.black, for: .normal)
        joinInitBTN.backgroundColor = .lightGray
        joinInitBTN.layer.borderWidth = 1
        joinInitBTN.layer.cornerRadius = 8
        joinInitBTN.contentHorizontalAlignment = .leading
        joinInitBTN.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        joinInitBTN.addTarget(self, action: #selector(testo(_ :)), for: .touchUpInside)
        joinInitBTN.isUserInteractionEnabled = true
        scrollView.addSubview(joinInitBTN)
        
        joinBTN = UIButton(frame: CGRect(x: 60, y: joinInitBTN.frame.maxY + 3, width: self.view.frame.size.width - 120, height: 40))
        joinBTN.setTitle("회원가입", for: .normal)
        joinBTN.setTitleColor(.black, for: .normal)
        joinBTN.backgroundColor = .lightGray
        joinBTN.layer.borderWidth = 1
        joinBTN.layer.cornerRadius = 8
        joinBTN.contentHorizontalAlignment = .leading
        joinBTN.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        joinBTN.addTarget(self, action: #selector(testo(_ :)), for: .touchUpInside)
        joinBTN.isUserInteractionEnabled = true
        scrollView.addSubview(joinBTN)
        
    }
    
    @objc func callMethod(){
        self.dismiss(animated: false)
    }
    
    @objc func test(_ sender: UIButton) {
        print("\(sender.tag)")
        
        self.arrBTN.forEach {
            if $0.tag == sender.tag {
                $0.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            } else {
                $0.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            }
        }
    }
    
    @objc func mailTest(_ sender: UIButton) {
        print("\(sender.tag)")
        
        self.mailArrBTN.forEach {
            if $0.tag == sender.tag {
                $0.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            } else {
                $0.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            }
        }
}
    @objc func mail(_ sender: UIButton){
        selected = !selected
        if selected {
            mailBTN.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        } else {
            mailBTN.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        }
    }
  
    @objc func testo(_ sender: UIButton) {
        
        UserDefaults.standard.set(nameTf.text, forKey: "myname")
        myName = UserDefaults.standard.string(forKey: "myname")!
        print("zxc\(myName)")
        
        let vc = LoginNoramlViewController()
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
        
        print("tab")
    }
    
}
