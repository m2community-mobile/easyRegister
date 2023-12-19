//
//  CreaditViewController.swift
//  easyRegister
//
//  Created by m2comm on 2023/11/08.
//

import Foundation
import UIKit




class CreaditViewController: BaseViewController {
    
    var info: UILabel = {
      var label = UILabel()
      label.text = "신청 정보"
      label.backgroundColor = .white
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    
    var eventTextString = ""
    
    // 일시 보내주기 1
    var testtest: UILabel!
    var testString = ""
    
    var name: UILabel = {
      var label = UILabel()
      label.text = "이름"
      label.backgroundColor = .red
//      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    var mail: UILabel = {
      var label = UILabel()
      label.text = "메일"
      label.backgroundColor = .red
//      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    
    var eventView: UIView!
    var eventHost: UILabel!
    var eventimage:UIImageView!
    var eventimg:UIImage!
//    var imgView : UIImage!
    var eventCategory: UILabel!
    var eventName: UILabel!
    var nameString = ""
    var eventDate: UILabel!
    //일시 보내주기 5
    var startDate: UILabel!
    var startDateString = ""
    
    var eventJoinDate: UILabel!
    var eventPlave: UILabel!
    var eventPerson: UILabel!
    
    
    
    var profileLabel: UILabel!
    var profileView: UIView!
    var profileName: UILabel!
    var profileTF: UITextField!
    var profilemail: UILabel!
    var profilemailTF: UITextField!
    var phone: UILabel!
    var phoneNum1: UITextField!
    var phoneNum2: UITextField!
    var phoneNum3: UITextField!
    var sexLabel: UILabel!
    var womanBTN: UIButton!
    var menBTN: UIButton!
    var arrBTN: [UIButton]!
    var profileetc: UILabel!
    var profileetcTF: UITextField!
    
    var registerInfo: UILabel!
    var registerInfoView: UIView!
    var registerInfoSelec1: UILabel!
    var registerInfoSelec1Btn: UIButton!
    var registerInfoSelec2: UILabel!
    var registerInfoSelec2Btn: UIButton!
    
    var agreeLabel: UILabel!
    var agreeView: UIView!
    var agreeBtn: UIButton!
    var selected = true
    
    var payView: UIView!
    var payLabel: UILabel!
    var payPrice: UILabel!
    var payCardBTN: UIButton!
    var payNoCardBTN: UIButton!
    var arrPayBTN: [UIButton]!
    var payNameLabel: UILabel!
    var payNameTF: UITextField!
    var payWhenLabel: UILabel!
    var payWhneTF: UITextField!
    var payInfoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.backgroundColor = #colorLiteral(red: 0.9137794375, green: 0.9245919585, blue: 0.966889441, alpha: 1)
        
        view.backgroundColor = .white
        print("hellow")
        naviBar.backgroundColor = .black
        
        
        img.image = nil
        
        
//        scrollView.addSubview(info)
//
//        info.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
//        info.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 40).isActive = true
//        info.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        eventView = UIView(frame: CGRect(x: 20, y: 20, width: self.view.frame.size.width - 40, height: 550))
        eventView.layer.borderWidth = 1
        eventView.layer.cornerRadius = 8
        eventView.backgroundColor = .white
        scrollView.addSubview(eventView)
        
        eventHost = UILabel(frame: CGRect(x: 20, y: 15, width: self.view.frame.size.width - 40, height: 30))
        eventHost.font = UIFont.systemFont(ofSize: 15)
        eventHost.text = "기업명"
        eventView.addSubview(eventHost)
        
        eventimage = UIImageView(frame: CGRect(x: 20, y: eventHost.frame.maxY + 5, width: eventView.frame.size.width - 40, height: 150))
        eventimage.backgroundColor = .white
        eventimage.image = imgView
        eventView.addSubview(eventimage)

        eventCategory = UILabel(frame: CGRect(x: 30, y: eventimage.frame.maxY + 20, width: 100, height: 20))
        eventCategory.text = "행사분류"
        eventCategory.font = UIFont.systemFont(ofSize: 16)
        eventCategory.layer.borderWidth = 1
        eventCategory.layer.cornerRadius = 18
        eventCategory.textAlignment = .center
        eventView.addSubview(eventCategory)
        
        eventName = UILabel(frame: CGRect(x: 30, y: eventCategory.frame.maxY + 20, width: eventView.frame.size.width - 60, height: 20))
        eventName.text = nameString
        eventName.font = UIFont.systemFont(ofSize: 20)
        eventView.addSubview(eventName)
        
        
        eventDate = UILabel(frame: CGRect(x: 20, y: eventName.frame.maxY + 30, width: 40, height: 20))
        eventDate.textAlignment = .center
        eventDate.text = "일시"
        eventDate.font = UIFont.systemFont(ofSize: 16)

        eventView.addSubview(eventDate)
        
        startDate = UILabel(frame: CGRect(x: eventDate.frame.maxX + 40, y: eventName.frame.maxY + 20, width: self.view.frame.size.width - 80, height: 40))
        startDate.numberOfLines = 0
        startDate.textAlignment = .left
        //여기 넣기
        
        //일시 보내주기6
        startDate.text = testString
        
        startDate.textColor = .lightGray
        startDate.font = UIFont.systemFont(ofSize: 16)

        eventView.addSubview(startDate)
        
        
        eventJoinDate = UILabel(frame: CGRect(x: 20, y: eventDate.frame.maxY + 20, width: 40, height: 20))
        eventJoinDate.textAlignment = .center
        eventJoinDate.text = "신청"
        eventJoinDate.font = UIFont.systemFont(ofSize: 16)

        eventView.addSubview(eventJoinDate)
        
//        submitDate = UILabel(frame: CGRect(x: submitDay.frame.maxX + 40, y: submitDay.frame.minY - 5, width: self.view.frame.size.width - 80, height: 40))
//        submitDate.numberOfLines = 0
//        submitDate.textAlignment = .left
//        submitDate.text = "2023년 11월 12일 09:00 ~ \n 2023년 11월 12일 06:00"
//        submitDate.textColor = .lightGray
//        submitDate.font = UIFont.systemFont(ofSize: 16)
//
//        eventView.addSubview(submitDate)
        
        
        eventPlave = UILabel(frame: CGRect(x: 20, y: eventJoinDate.frame.maxY + 30, width: 40, height: 20))
        eventPlave.textAlignment = .center
        eventPlave.text = "장소"
        eventPlave.font = UIFont.systemFont(ofSize: 16)

        eventView.addSubview(eventPlave)
        
//        placeText = UILabel(frame: CGRect(x: placeLabel.frame.maxX + 40, y: placeLabel.frame.minY - 5, width: self.view.frame.size.width - 80, height: 40))
//        placeText.numberOfLines = 0
//        placeText.textAlignment = .left
//        placeText.text = "코엑스"
//        placeText.textColor = .lightGray
//        placeText.font = UIFont.systemFont(ofSize: 16)
//
//        eventView.addSubview(placeText)
        
        eventPerson = UILabel(frame: CGRect(x: 20, y: eventPlave.frame.maxY + 30, width: 80, height: 20))
        eventPerson.textAlignment = .center
        eventPerson.text = "모집인원"
        eventPerson.font = UIFont.systemFont(ofSize: 16)

        eventView.addSubview(eventPerson)
        
//        numberLabel = UILabel(frame: CGRect(x: numberOfPerson.frame.maxX + 40, y: numberOfPerson.frame.minY - 5, width: self.view.frame.size.width - 80, height: 40))
//        numberLabel.numberOfLines = 0
//        numberLabel.textAlignment = .left
//        numberLabel.text = "100 명"
//        numberLabel.textColor = .lightGray
//        numberLabel.font = UIFont.systemFont(ofSize: 16)
//
//        eventView.addSubview(numberLabel)
        
//        eventName = UILabel(frame: CGRect(x: 20, y: eventInfo.frame.maxY + 10, width: self.view.frame.size.width - 40, height: 30))
//        eventName.text = eventTextString
//        scrollView.addSubview(eventName)
        
        testtest = UILabel(frame: CGRect(x: 20, y: eventName.frame.maxY + 10, width: self.view.frame.size.width - 40, height: 30))
        // 일시 보내주기3
        testtest.text = testString
//        scrollView.addSubview(testtest)
        
        
        profileLabel = UILabel(frame: CGRect(x: 20, y: eventView.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 30))
        profileLabel.font = UIFont.systemFont(ofSize: 20)
        profileLabel.text = "신청자 정보"
        scrollView.addSubview(profileLabel)
        
        profileView = UIView(frame: CGRect(x: 20, y: profileLabel.frame.maxY + 10, width: self.view.frame.size.width - 40, height: 550))
        profileView.layer.borderWidth = 1
        profileView.layer.cornerRadius = 8
        profileView.backgroundColor = .white
        scrollView.addSubview(profileView)
        
        profileName = UILabel(frame: CGRect(x: 20, y: 20, width: self.view.frame.size.width - 40, height: 40))
        profileName.text = "이름"
        profileView.addSubview(profileName)
        
        profileTF = UITextField(frame: CGRect(x: 20, y: profileName.frame.maxY + 5, width: profileView.frame.size.width - 40, height: 40))
        profileTF.placeholder = ""
        
        profileTF.text = myName
        
        profileTF.layer.borderWidth = 1
        profileTF.layer.cornerRadius = 8
        //        nameTf.layer.addBorder([.bottom], color: .lightGray, width: 1)
        profileView.addSubview(profileTF)
        
        profilemail = UILabel(frame: CGRect(x: 20, y: profileTF.frame.maxY + 3, width: profileView.frame.size.width - 40, height: 40))
        profilemail.text = "이메일"
        profileView.addSubview(profilemail)
        
        profilemailTF = UITextField(frame: CGRect(x: 20, y: profilemail.frame.maxY + 5, width: profileView.frame.size.width - 40, height: 40))
        profilemailTF.placeholder = ""
        profilemailTF.layer.borderWidth = 1
        profilemailTF.layer.cornerRadius = 8
        //        nameTf.layer.addBorder([.bottom], color: .lightGray, width: 1)
        profileView.addSubview(profilemailTF)
        
        phone = UILabel(frame: CGRect(x: 20, y: profilemailTF.frame.maxY + 20, width: self.view.frame.size.width - 120, height: 40))
        phone.text = "전화번호"
        profileView.addSubview(phone)
        
        phoneNum1 = UITextField(frame: CGRect(x: self.view.frame.size.width / 5.5, y: phone.frame.maxY + 5, width: 70, height: 40))
        phoneNum1.backgroundColor = .white
        phoneNum1.layer.borderWidth = 1
        phoneNum1.layer.cornerRadius = 8
        phoneNum1.contentHorizontalAlignment = .center
//        phoneNum2.isUserInteractionEnabled = true
        profileView.addSubview(phoneNum1)
        
        phoneNum2 = UITextField(frame: CGRect(x: self.view.frame.size.width / 2.5, y: phone.frame.maxY + 5, width: 70, height: 40))
        phoneNum2.backgroundColor = .white
        phoneNum2.layer.borderWidth = 1
        phoneNum2.layer.cornerRadius = 8
        phoneNum2.contentHorizontalAlignment = .center
//        phoneNum2.isUserInteractionEnabled = true
        profileView.addSubview(phoneNum2)
        
        phoneNum3 = UITextField(frame: CGRect(x: self.view.frame.size.width / 1.6, y: phone.frame.maxY + 5, width: 70, height: 40))
        phoneNum3.backgroundColor = .white
        phoneNum3.layer.borderWidth = 1
        phoneNum3.layer.cornerRadius = 8
        phoneNum3.contentHorizontalAlignment = .center
//        phoneNum3.isUserInteractionEnabled = true
        profileView.addSubview(phoneNum3)
        
        sexLabel = UILabel(frame: CGRect(x: 20, y: phoneNum1.frame.maxY + 3, width: self.view.frame.size.width - 40, height: 40))
        sexLabel.text = "성별"
        profileView.addSubview(sexLabel)
        
        
        womanBTN = UIButton(frame: CGRect(x: 20, y: sexLabel.frame.maxY, width: 50, height: 20))
        womanBTN.setTitle(" 여성", for: .normal)
        womanBTN.backgroundColor = .white
        womanBTN.setTitleColor(.blue, for: .normal)
        womanBTN.contentHorizontalAlignment = .center
        womanBTN.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        womanBTN.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        womanBTN.tag = 0
        
        //        womanBTN.setImage(UIImage(named: "id"), for: .normal)
//        womanBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        profileView.addSubview(womanBTN)
        
        
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
        profileView.addSubview(menBTN)
        
        arrBTN = [womanBTN, menBTN]
        
        self.arrBTN.forEach {
            $0.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        }
        
        profileetc = UILabel(frame: CGRect(x: 20, y: womanBTN.frame.maxY + 20, width: profileView.frame.size.width - 40, height: 40))
        profileetc.text = "수집사항1"
        profileView.addSubview(profileetc)
        
        profileetcTF = UITextField(frame: CGRect(x: 20, y: profileetc.frame.maxY + 5, width: profileView.frame.size.width - 40, height: 40))
        profileetcTF.placeholder = ""
        profileetcTF.layer.borderWidth = 1
        profileetcTF.layer.cornerRadius = 8
        //        nameTf.layer.addBorder([.bottom], color: .lightGray, width: 1)
        profileView.addSubview(profileetcTF)
        
        
        
        registerInfo = UILabel(frame: CGRect(x: 20, y: profileView.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 30))
        registerInfo.font = UIFont.systemFont(ofSize: 20)
        registerInfo.text = "등록 정보"
        scrollView.addSubview(registerInfo)
        
        registerInfoView = UIView(frame: CGRect(x: 20, y: registerInfo.frame.maxY + 10, width: self.view.frame.size.width - 40, height: 250))
        registerInfoView.layer.borderWidth = 1
        registerInfoView.layer.cornerRadius = 8
        registerInfoView.backgroundColor = .white
        scrollView.addSubview(registerInfoView)
        
        
        registerInfoSelec1 = UILabel(frame: CGRect(x: 20, y: 20, width: registerInfoView.frame.size.width - 40, height: 40))
        registerInfoSelec1.text = "그룹선택"
        registerInfoView.addSubview(registerInfoSelec1)
        
        registerInfoSelec1Btn = UIButton(frame: CGRect(x: 20, y: registerInfoSelec1.frame.maxY + 5, width: registerInfoView.frame.size.width - 40, height: 40))
        registerInfoSelec1Btn.setTitle("그룹1", for: .normal)
        registerInfoSelec1Btn.setTitleColor(.black, for: .normal)
        registerInfoSelec1Btn.backgroundColor = .white
        registerInfoSelec1Btn.layer.borderWidth = 1
        registerInfoSelec1Btn.layer.cornerRadius = 8
        registerInfoSelec1Btn.contentHorizontalAlignment = .center
        registerInfoSelec1Btn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
//        registerInfoSelec1Btn.addTarget(self, action: #selector(testo(_ :)), for: .touchUpInside)
        registerInfoSelec1Btn.isUserInteractionEnabled = true
        registerInfoView.addSubview(registerInfoSelec1Btn)
        
        registerInfoSelec2 = UILabel(frame: CGRect(x: 20, y: registerInfoSelec1Btn.frame.maxY + 20, width: registerInfoView.frame.size.width - 40, height: 40))
        registerInfoSelec2.text = "옵션선택"
        registerInfoView.addSubview(registerInfoSelec2)
        
        registerInfoSelec2Btn = UIButton(frame: CGRect(x: 20, y: registerInfoSelec2.frame.maxY + 5, width: registerInfoView.frame.size.width - 40, height: 40))
        registerInfoSelec2Btn.setTitle("그룹1 > 옵션", for: .normal)
        registerInfoSelec2Btn.setTitleColor(.black, for: .normal)
        registerInfoSelec2Btn.backgroundColor = .white
        registerInfoSelec2Btn.layer.borderWidth = 1
        registerInfoSelec2Btn.layer.cornerRadius = 8
        registerInfoSelec2Btn.contentHorizontalAlignment = .center
        registerInfoSelec2Btn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
//        registerInfoSelec1Btn.addTarget(self, action: #selector(testo(_ :)), for: .touchUpInside)
        registerInfoSelec2Btn.isUserInteractionEnabled = true
        registerInfoView.addSubview(registerInfoSelec2Btn)
        
        agreeLabel = UILabel(frame: CGRect(x: 20, y: registerInfoView.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 30))
        agreeLabel.font = UIFont.systemFont(ofSize: 20)
        agreeLabel.text = "개인정보 수집 동의 내용"
        scrollView.addSubview(agreeLabel)
        
        agreeView = UIView(frame: CGRect(x: 20, y: agreeLabel.frame.maxY + 10, width: self.view.frame.size.width - 40, height: 250))
        agreeView.layer.borderWidth = 1
        agreeView.layer.cornerRadius = 8
        agreeView.backgroundColor = .white
        scrollView.addSubview(agreeView)
        
        agreeBtn = UIButton(frame: CGRect(x: agreeView.frame.maxX - 100, y: agreeView.frame.maxY + 3, width: 100, height: 30))
        agreeBtn.setTitle("동의합니다.", for: .normal)
//        agreeBtn.backgroundColor = .lightGray
        agreeBtn.setTitleColor(.black, for: .normal)
        agreeBtn.contentHorizontalAlignment = .center
//        agreeBtn.layer.borderWidth = 1
//        agreeBtn.layer.cornerRadius = 8
        agreeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        agreeBtn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        agreeBtn.addTarget(self, action: #selector(agree(_ :)), for: .touchUpInside)
        
        scrollView.addSubview(agreeBtn)
        
        
        payView = UIView(frame: CGRect(x: 20, y: agreeBtn.frame.maxY + 30, width: self.view.frame.size.width - 40, height: 450))
        payView.layer.borderWidth = 1
        payView.layer.cornerRadius = 8
        payView.backgroundColor = .white
        scrollView.addSubview(payView)
        
        payLabel = UILabel(frame: CGRect(x: 20, y: 20, width: payView.frame.size.width - 40, height: 30))
        payLabel.text = "금액"
        payLabel.font = UIFont.systemFont(ofSize: 24)
        payView.addSubview(payLabel)
        
        payPrice = UILabel(frame: CGRect(x: 20, y: payLabel.frame.maxY + 5, width: payView.frame.size.width - 40, height: 30))
        payPrice.text = "test"
        payPrice.textColor = #colorLiteral(red: 0.9002554417, green: 0.07608199865, blue: 0.3694014549, alpha: 1)
        payPrice.font = UIFont.systemFont(ofSize: 24)
        payView.addSubview(payPrice)
        
        payCardBTN = UIButton(frame: CGRect(x: 20, y: payPrice.frame.maxY + 20, width: 170, height: 45))
        payCardBTN.setTitle("카드결제", for: .normal)
        payCardBTN.backgroundColor = #colorLiteral(red: 0.984313786, green: 0.984313786, blue: 0.984313786, alpha: 1)
        payCardBTN.layer.borderWidth = 1
        payCardBTN.layer.cornerRadius = 8
        payCardBTN.setTitleColor(.black, for: .normal)
        payCardBTN.contentHorizontalAlignment = .center
        payCardBTN.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        payCardBTN.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        payCardBTN.tag = 0
        
        //        womanBTN.setImage(UIImage(named: "id"), for: .normal)
        payCardBTN.addTarget(self, action: #selector(cardAction(_ :)), for: .touchUpInside)
        payView.addSubview(payCardBTN)
        
        
        
        
        payNoCardBTN = UIButton(frame: CGRect(x: payCardBTN.frame.maxX + 10, y: payPrice.frame.maxY + 20, width: 170, height: 45))
        payNoCardBTN.setTitle("무통장결제", for: .normal)
        payNoCardBTN.backgroundColor = #colorLiteral(red: 0.984313786, green: 0.984313786, blue: 0.984313786, alpha: 1)
        payNoCardBTN.layer.borderWidth = 1
        payNoCardBTN.layer.cornerRadius = 8
        payNoCardBTN.setTitleColor(.black, for: .normal)
        payNoCardBTN.contentHorizontalAlignment = .center
        payNoCardBTN.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        payNoCardBTN.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        payNoCardBTN.tag = 1
        
        //        womanBTN.setImage(UIImage(named: "id"), for: .normal)
        payNoCardBTN.addTarget(self, action: #selector(cardAction(_ :)), for: .touchUpInside)
        payView.addSubview(payNoCardBTN)
        
        arrPayBTN = [payCardBTN, payNoCardBTN]
        
        payNameLabel = UILabel(frame: CGRect(x: 20, y: payCardBTN.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 40))
        payNameLabel.text = "입금자명"
        payView.addSubview(payNameLabel)
        
        payNameTF = UITextField(frame: CGRect(x: 20, y: payNameLabel.frame.maxY + 5, width: profileView.frame.size.width - 40, height: 40))
        payNameTF.placeholder = ""
        payNameTF.layer.borderWidth = 1
        payNameTF.layer.cornerRadius = 8
        //        nameTf.layer.addBorder([.bottom], color: .lightGray, width: 1)
        payView.addSubview(payNameTF)
        
        payWhenLabel = UILabel(frame: CGRect(x: 20, y: payNameTF.frame.maxY + 5, width: self.view.frame.size.width - 40, height: 40))
        payWhenLabel.text = "입금예정일"
        payView.addSubview(payWhenLabel)
        
        payWhneTF = UITextField(frame: CGRect(x: 20, y: payWhenLabel.frame.maxY + 5, width: profileView.frame.size.width - 40, height: 40))
        payWhneTF.placeholder = ""
        payWhneTF.layer.borderWidth = 1
        payWhneTF.layer.cornerRadius = 8
        //        nameTf.layer.addBorder([.bottom], color: .lightGray, width: 1)
        payView.addSubview(payWhneTF)
        
        payInfoLabel = UILabel(frame: CGRect(x: 20, y: payWhneTF.frame.maxY + 15, width: payView.frame.size.width - 40, height: 60))
        
        payInfoLabel.numberOfLines = 0

        payInfoLabel.font = UIFont.systemFont(ofSize: 15)
        var payString = """
        입금정보
        계좌번호: 1234-567778
        예금주명: 엠투커뮤니티
        """
        
        
        
        payInfoLabel.text = payString
        
        payView.addSubview(payInfoLabel)
        
        
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: naviBar.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: payView.bottomAnchor, constant: 100).isActive = true


//        scrollView.addSubview(labelTwo)
//        labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
//        labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 3000).isActive = true
//        labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
        
        
        
        testButton.backgroundColor = #colorLiteral(red: 0.1525377631, green: 0.5048412681, blue: 0.8048926592, alpha: 1)
        testButton.setTitle("결제하기", for: .normal)
//        testButton.frame = CGRect(x: 0, y: self.view.frame.maxY - 100, width: self.view.frame.size.width, height: self.view.frame.size.height / 6)
        testButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(testButton)
        testButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        testButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 2350).isActive = true
        testButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        testButton.widthAnchor.constraint(equalToConstant: self.view.frame.size.width).isActive = true
        testButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        footer.isHidden = true
        
        
        
        
        
        testButton.addTarget(self, action: #selector(goPay(_ :)), for: .touchUpInside)
//        img = UIImageView(frame: CGRect(x: 0, y: naviBar.frame.maxY, width: self.view.frame.width, height: self.view.frame.height / 3))
////        img.backgroundColor = .yellow
//        self.view.addSubview(img)
        
        
        
//        testButton.isHidden = true
        
        
  
        
        
        
        
    }
    
    @objc func goPay(_ sender: UIButton) {
        
        
        
        let vc = FinshPaymentViewController()
        
        
//        vc.eventimg = img.image
        vc.eventimg = imgView
        vc.nameString = eventTextString
        //일시 보내주기 4
        vc.startDateString = testString
        
        
        
        vc.modalPresentationStyle = .fullScreen
        
//        sceneDel?.window?.rootViewController?.present(vc, animated: true)
        self.present(vc, animated: false)
        
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
    @objc func agree(_ sender: UIButton){
        selected = !selected
        if selected {
            agreeBtn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        } else {
            agreeBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        }
    }
    
    @objc func cardAction(_ sender: UIButton) {
        print("\(sender.tag)")
        
        self.arrPayBTN.forEach {
            if $0.tag == sender.tag {
//                $0.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
                $0.setTitleColor(.red, for: .normal)
                $0.backgroundColor = #colorLiteral(red: 1, green: 0.9659478068, blue: 0.9063668847, alpha: 1)
            } else {
//                $0.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
                $0.setTitleColor(.black, for: .normal)
                $0.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }
    }
}

