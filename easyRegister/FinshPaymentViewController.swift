//
//  File.swift
//  easyRegister
//
//  Created by m2comm on 2023/11/30.
//

import Foundation
import UIKit

var joinArray: [String] = []

var payImage : [UIImage] = []

class FinshPaymentViewController: UIViewController {
    
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
    
    
    
    var logoImage: UIImageView!
    
    var finishLabel: UILabel!
    var checkLabel: UILabel!
    
    var eventInfo: UILabel!
    var eventView: UIView!
    var eventHost: UILabel!
    var eventimage:UIImageView!
    var eventimg:UIImage!
    var imgView : UIImage!
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
    
    
    
    var joinInfo: UILabel!
    var joinView: UIView!
    var name: UILabel!
    var nameTextString = ""
    var mail: UILabel!
    var mailTextString = ""
    var phone: UILabel!
    var phoneTextString = ""
    var etc: UILabel!
    
    var state: UILabel!
    var stateView: UIView!
    var nowState: UILabel!
    var nowStateText = ""
    
    var payState: UILabel!
    var payStateView: UIView!
    var payString: UILabel!
    var payAnswer: UILabel!
    
    var payInfo: UILabel!
    var payInfoView: UIView!
    var payInfoString: UILabel!
    var payInfoAnswer: UILabel!
    
    var goHomeBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.backgroundColor = #colorLiteral(red: 0.9137794375, green: 0.9245919585, blue: 0.966889441, alpha: 1)
        
        setUi()
    }
    
    
    func setUi() {
        
        self.view.addSubview(scrollView)

        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

//          scrollView.addSubview(labelOne)
//
//          labelOne.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
//          labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true

        scrollView.addSubview(labelTwo)
        labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 3000).isActive = true
        labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
        
        logoImage = UIImageView(frame: CGRect(x: self.view.frame.size.width / 3.4, y: 45, width: 200, height: 350))
        logoImage.image = UIImage(named: "finish")
        scrollView.addSubview(logoImage)
        
        finishLabel = UILabel(frame: CGRect(x: 20, y: logoImage.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 30))
        finishLabel.font = UIFont.systemFont(ofSize: 24)
        finishLabel.textAlignment = .center
        finishLabel.text = "행사신청이 완료되었습니다."
        scrollView.addSubview(finishLabel)
        
        checkLabel = UILabel(frame: CGRect(x: 20, y: finishLabel.frame.maxY + 10, width: self.view.frame.size.width - 40, height: 30))
        checkLabel.font = UIFont.systemFont(ofSize: 15)
        checkLabel.text = "등록 내용을 확인하세요."
        checkLabel.textAlignment = .center
        scrollView.addSubview(checkLabel)
        









        eventInfo = UILabel(frame: CGRect(x: 20, y: checkLabel.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 30))
        eventInfo.font = UIFont.systemFont(ofSize: 20)
        eventInfo.text = "행사정보"
        scrollView.addSubview(eventInfo)
        
        eventView = UIView(frame: CGRect(x: 20, y: eventInfo.frame.maxY + 5, width: self.view.frame.size.width - 40, height: 550))
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
        eventimage.image = eventimg
        

        print("sd;lj;sj;ad;lkas;lk\(eventimage.image)")
        
        
        
        
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
        startDate.text = startDateString
        
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
        
        
        joinInfo = UILabel(frame: CGRect(x: 20, y: eventView.frame.maxY + 30, width: self.view.frame.size.width - 40, height: 30))
        joinInfo.font = UIFont.systemFont(ofSize: 20)
        joinInfo.text = "신청정보"
        scrollView.addSubview(joinInfo)
        
        joinView = UIView(frame: CGRect(x: 20, y: joinInfo.frame.maxY + 5, width: self.view.frame.size.width - 40, height: 400))
        joinView.layer.borderWidth = 1
        joinView.layer.cornerRadius = 8
        joinView.backgroundColor = .white
        scrollView.addSubview(joinView)
        
        name = UILabel(frame: CGRect(x: 20, y: 25, width: eventView.frame.size.width - 60, height: 20))
        name.text = "이름"
        name.font = UIFont.systemFont(ofSize: 16)
        joinView.addSubview(name)
        
        name = UILabel(frame: CGRect(x: 20, y: name.frame.maxY + 10, width: eventView.frame.size.width - 60, height: 20))
        name.text = myName
        name.font = UIFont.systemFont(ofSize: 18)
        joinView.addSubview(name)
        
        mail = UILabel(frame: CGRect(x: 20, y: name.frame.maxY + 20, width: eventView.frame.size.width - 60, height: 20))
        mail.text = "이메일"
        mail.font = UIFont.systemFont(ofSize: 16)
        joinView.addSubview(mail)
        
        mail = UILabel(frame: CGRect(x: 20, y: mail.frame.maxY + 10, width: eventView.frame.size.width - 60, height: 20))
        mail.text = "test123@gmail.com"
        mail.font = UIFont.systemFont(ofSize: 18)
        joinView.addSubview(mail)
        
        phone = UILabel(frame: CGRect(x: 20, y: mail.frame.maxY + 20, width: eventView.frame.size.width - 60, height: 20))
        phone.text = "핸드폰번호"
        phone.font = UIFont.systemFont(ofSize: 16)
        joinView.addSubview(phone)
        
        phone = UILabel(frame: CGRect(x: 20, y: phone.frame.maxY + 10, width: eventView.frame.size.width - 60, height: 20))
        phone.text = "010-1234-5678"
        phone.font = UIFont.systemFont(ofSize: 18)
        joinView.addSubview(phone)
        
        etc = UILabel(frame: CGRect(x: 20, y: phone.frame.maxY + 20, width: eventView.frame.size.width - 60, height: 20))
        etc.text = "수집사항1"
        etc.font = UIFont.systemFont(ofSize: 16)
        joinView.addSubview(etc)
        
        etc = UILabel(frame: CGRect(x: 20, y: etc.frame.maxY + 10, width: eventView.frame.size.width - 60, height: 20))
        etc.text = "수집사항1 입력내용"
        etc.font = UIFont.systemFont(ofSize: 18)
        joinView.addSubview(etc)
        
        etc = UILabel(frame: CGRect(x: 20, y: etc.frame.maxY + 20, width: eventView.frame.size.width - 60, height: 20))
        etc.text = "수집사항2"
        etc.font = UIFont.systemFont(ofSize: 16)
        joinView.addSubview(etc)
        
        etc = UILabel(frame: CGRect(x: 20, y: etc.frame.maxY + 10, width: eventView.frame.size.width - 60, height: 20))
        etc.text = "수집사항2 입력내용"
        etc.font = UIFont.systemFont(ofSize: 18)
        joinView.addSubview(etc)
        
        
        state = UILabel(frame: CGRect(x: 20, y: joinView.frame.maxY + 30, width: self.view.frame.size.width - 40, height: 30))
        state.font = UIFont.systemFont(ofSize: 20)
        state.text = "신청상태"
        scrollView.addSubview(state)
        
        stateView = UIView(frame: CGRect(x: 20, y: state.frame.maxY + 5, width: self.view.frame.size.width - 40, height: 60))
        stateView.layer.borderWidth = 1
        stateView.layer.cornerRadius = 8
        stateView.backgroundColor = .white
        scrollView.addSubview(stateView)
        
        nowState = UILabel(frame: CGRect(x: 25, y: 15, width: 100, height: 30))
        nowState.font = UIFont.systemFont(ofSize: 20)
        nowState.layer.borderWidth = 1
        nowState.layer.cornerRadius = 8
        nowState.textAlignment = .center
        nowState.backgroundColor = #colorLiteral(red: 0.9137794375, green: 0.9245919585, blue: 0.966889441, alpha: 1)
        nowState.text = "참가대기"
        stateView.addSubview(nowState)
        
        payState = UILabel(frame: CGRect(x: 20, y: stateView.frame.maxY + 30, width: self.view.frame.size.width - 40, height: 30))
        payState.font = UIFont.systemFont(ofSize: 20)
        payState.text = "결제상태"
        scrollView.addSubview(payState)
        
        payStateView = UIView(frame: CGRect(x: 20, y: payState.frame.maxY + 5, width: self.view.frame.size.width - 40, height: 280))
        payStateView.layer.borderWidth = 1
        payStateView.layer.cornerRadius = 8
        payStateView.backgroundColor = .white
        scrollView.addSubview(payStateView)
        
        payString = UILabel(frame: CGRect(x: 20, y: 20, width: self.view.frame.size.width - 40, height: 30))
        payString.font = UIFont.systemFont(ofSize: 16)
        payString.text = "결제방법"
        payStateView.addSubview(payString)
        
        payAnswer = UILabel(frame: CGRect(x: 20, y: payString.frame.maxY + 5, width: self.view.frame.size.width - 40, height: 30))
        payAnswer.font = UIFont.systemFont(ofSize: 16)
        payAnswer.text = "무통장결제"
        payStateView.addSubview(payAnswer)
        
        payString = UILabel(frame: CGRect(x: 20, y: payAnswer.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 30))
        payString.font = UIFont.systemFont(ofSize: 16)
        payString.text = "입금자명/결제예정일"
        payStateView.addSubview(payString)
        
        payAnswer = UILabel(frame: CGRect(x: 20, y: payString.frame.maxY + 5, width: self.view.frame.size.width - 40, height: 30))
        payAnswer.font = UIFont.systemFont(ofSize: 16)
        payAnswer.text = "people/2023.12.24"
        payStateView.addSubview(payAnswer)
        
        payString = UILabel(frame: CGRect(x: 20, y: payAnswer.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 30))
        payString.font = UIFont.systemFont(ofSize: 16)
        payString.text = "입금상태"
        payStateView.addSubview(payString)
        
        payAnswer = UILabel(frame: CGRect(x: 20, y: payString.frame.maxY + 5, width: self.view.frame.size.width - 40, height: 30))
        payAnswer.font = UIFont.systemFont(ofSize: 16)
        payAnswer.text = "미납"
        payStateView.addSubview(payAnswer)
        
        payInfo = UILabel(frame: CGRect(x: 20, y: payStateView.frame.maxY + 30, width: self.view.frame.size.width - 40, height: 30))
        payInfo.font = UIFont.systemFont(ofSize: 20)
        payInfo.text = "무통장결제 정보"
        scrollView.addSubview(payInfo)
        
        payInfoView = UIView(frame: CGRect(x: 20, y: payInfo.frame.maxY + 5, width: self.view.frame.size.width - 40, height: 280))
        payInfoView.layer.borderWidth = 1
        payInfoView.layer.cornerRadius = 8
        payInfoView.backgroundColor = .white
        scrollView.addSubview(payInfoView)
        
        payInfoString = UILabel(frame: CGRect(x: 20, y: 20, width: self.view.frame.size.width - 40, height: 30))
        payInfoString.font = UIFont.systemFont(ofSize: 16)
        payInfoString.text = "은헹명"
        payInfoView.addSubview(payInfoString)
        
        payInfoAnswer = UILabel(frame: CGRect(x: 20, y: payInfoString.frame.maxY + 5, width: self.view.frame.size.width - 40, height: 30))
        payInfoAnswer.font = UIFont.systemFont(ofSize: 16)
        payInfoAnswer.text = "엠투은행"
        payInfoView.addSubview(payInfoAnswer)
        
        payInfoString = UILabel(frame: CGRect(x: 20, y: payInfoAnswer.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 30))
        payInfoString.font = UIFont.systemFont(ofSize: 16)
        payInfoString.text = "계좌번호"
        payInfoView.addSubview(payInfoString)
        
        payInfoAnswer = UILabel(frame: CGRect(x: 20, y: payInfoString.frame.maxY + 5, width: self.view.frame.size.width - 40, height: 30))
        payInfoAnswer.font = UIFont.systemFont(ofSize: 16)
        payInfoAnswer.text = "1234-893766678"
        payInfoView.addSubview(payInfoAnswer)
        
        payInfoString = UILabel(frame: CGRect(x: 20, y: payInfoAnswer.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 30))
        payInfoString.font = UIFont.systemFont(ofSize: 16)
        payInfoString.text = "예금주명"
        payInfoView.addSubview(payInfoString)
        
        payInfoAnswer = UILabel(frame: CGRect(x: 20, y: payInfoString.frame.maxY + 5, width: self.view.frame.size.width - 40, height: 30))
        payInfoAnswer.font = UIFont.systemFont(ofSize: 16)
        payInfoAnswer.text = "엠투커뮤니티"
        payInfoView.addSubview(payInfoAnswer)
        
        goHomeBTN = UIButton(frame: CGRect(x: 20, y: payInfoView.frame.maxY + 40, width: self.view.frame.size.width - 40, height: 60))
        goHomeBTN.setTitle("홈화면으로 돌아가기", for: .normal)
        goHomeBTN.layer.borderWidth =  1
        goHomeBTN.layer.cornerRadius = 8
        goHomeBTN.backgroundColor = #colorLiteral(red: 0.3374005556, green: 0.3552100658, blue: 0.4269523621, alpha: 1)
        goHomeBTN.addTarget(self, action: #selector(goHome(_ :)), for: .touchUpInside)
        scrollView.addSubview(goHomeBTN)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: goHomeBTN.bottomAnchor, constant: 50).isActive = true
    }
    
    @objc func goHome(_ sender: UIButton) {
        

        
        
        
        let vc = TabBarController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
        

        
        
        
        
        
        payImage.append(eventimg)
        
        
        
        //              print("save-->\(arr)")
        print("saveData-->\(payImage)")
        
        //                titleString.append(jsonTest2[0].item[index].title)
        //                UserDefaults.standard.set(titleString, forKey: "title")
        //
        //                saveTitle = UserDefaults.standard.array(forKey: "title")!
        //                print("723981723982738921731289\(saveTitle)")
        
        
        
//        payImage.append(eventimg)
//        print("payImagepayImage\(payImage)")
//       payImage = [eventimg]
//        print("payImagepayImage\(payImage)")
        
        
    }
    
    
}
