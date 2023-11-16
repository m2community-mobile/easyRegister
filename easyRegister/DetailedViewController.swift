//
//  DetailedViewController.swift
//  easyRegister
//
//  Created by m2comm on 2023/10/23.
//

import Foundation
import UIKit


class DetailedViewController: BaseViewController {
    
    var eventLabel: UILabel!
    
    var startDay: UILabel!
    var startDate: UILabel!
    
    var submitDay: UILabel!
    var submitDate: UILabel!
    
    var placeLabel: UILabel!
    var placeText: UILabel!
    
    var numberOfPerson: UILabel!
    var numberLabel: UILabel!
    
    var shareBTN: UIButton!
    var heartBTN: UIButton!
    
    var pdfView: UIView!
    
    var eventInfoLabel: UILabel!
    var eventInfo : UILabel!
    var eventDetailBTN: UIButton!
    var isOpen: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageSet()
        
        
        
    }
    
    func imageSet() {
        
        
        footer.backgroundColor = .blue
    
        testButton.addTarget(self, action: #selector(testBtn(_ :)), for: .touchUpInside)
        
        
        eventLabel = UILabel(frame: CGRect(x: 20, y: img.frame.maxY + 20, width: 100, height: 30))
        eventLabel.textAlignment = .center
        eventLabel.text = "행사분류"
        eventLabel.layer.cornerRadius = 18
        eventLabel.layer.borderWidth = 1
//        eventLabel.backgroundColor = .black
//        eventLabel.textColor = .white
        scrollView.addSubview(eventLabel)
        
        
        textIn = UILabel(frame: CGRect(x: 40, y: eventLabel.frame.maxY + 20, width: 100, height: 20))
        textIn.text = textString
        textIn.font = UIFont.systemFont(ofSize: 24)
        scrollView.addSubview(textIn)
        
        subTitleIn = UILabel(frame: CGRect(x: 30, y: textIn.frame.maxY + 20, width: self.view.frame.size.width - 60, height: 100))
        subTitleIn.layer.cornerRadius = 8
        subTitleIn.layer.borderWidth = 1
        subTitleIn.text = subTitleStrings
        scrollView.addSubview(subTitleIn)
        
        
        startDay = UILabel(frame: CGRect(x: 20, y: subTitleIn.frame.maxY + 30, width: 40, height: 30))
        startDay.textAlignment = .center
        startDay.text = "일시"
        startDay.font = UIFont.systemFont(ofSize: 20)

        scrollView.addSubview(startDay)
        
        startDate = UILabel(frame: CGRect(x: startDay.frame.maxX + 40, y: startDay.frame.minY - 5, width: self.view.frame.size.width - 80, height: 40))
        startDate.numberOfLines = 0
        startDate.textAlignment = .left
        startDate.text = "2023년 12월 6일 11:00 ~ \n 2023년 12월 6일 06:30"
        startDate.textColor = .lightGray
        startDate.font = UIFont.systemFont(ofSize: 16)

        scrollView.addSubview(startDate)
        
        
        submitDay = UILabel(frame: CGRect(x: 20, y: startDay.frame.maxY + 30, width: 40, height: 30))
        submitDay.textAlignment = .center
        submitDay.text = "신청"
        submitDay.font = UIFont.systemFont(ofSize: 20)

        scrollView.addSubview(submitDay)
        
        submitDate = UILabel(frame: CGRect(x: submitDay.frame.maxX + 40, y: submitDay.frame.minY - 5, width: self.view.frame.size.width - 80, height: 40))
        submitDate.numberOfLines = 0
        submitDate.textAlignment = .left
        submitDate.text = "2023년 11월 12일 09:00 ~ \n 2023년 11월 12일 06:00"
        submitDate.textColor = .lightGray
        submitDate.font = UIFont.systemFont(ofSize: 16)

        scrollView.addSubview(submitDate)
        
        
        placeLabel = UILabel(frame: CGRect(x: 20, y: submitDay.frame.maxY + 30, width: 40, height: 30))
        placeLabel.textAlignment = .center
        placeLabel.text = "장소"
        placeLabel.font = UIFont.systemFont(ofSize: 20)

        scrollView.addSubview(placeLabel)
        
        placeText = UILabel(frame: CGRect(x: placeLabel.frame.maxX + 40, y: placeLabel.frame.minY - 5, width: self.view.frame.size.width - 80, height: 40))
        placeText.numberOfLines = 0
        placeText.textAlignment = .left
        placeText.text = "코엑스"
        placeText.textColor = .lightGray
        placeText.font = UIFont.systemFont(ofSize: 16)

        scrollView.addSubview(placeText)
        
        numberOfPerson = UILabel(frame: CGRect(x: 20, y: placeLabel.frame.maxY + 30, width: 80, height: 30))
        numberOfPerson.textAlignment = .center
        numberOfPerson.text = "모집인원"
        numberOfPerson.font = UIFont.systemFont(ofSize: 20)

        scrollView.addSubview(numberOfPerson)
        
        numberLabel = UILabel(frame: CGRect(x: numberOfPerson.frame.maxX + 40, y: numberOfPerson.frame.minY - 5, width: self.view.frame.size.width - 80, height: 40))
        numberLabel.numberOfLines = 0
        numberLabel.textAlignment = .left
        numberLabel.text = "100 명"
        numberLabel.textColor = .lightGray
        numberLabel.font = UIFont.systemFont(ofSize: 16)
        
        scrollView.addSubview(numberLabel)
        
        shareBTN = UIButton(frame: CGRect(x: 20, y: numberOfPerson.frame.maxY + 20, width: self.view.frame.size.width / 2 - 40, height: 50))
        shareBTN.layer.borderWidth = 1
        shareBTN.layer.cornerRadius = 8
        shareBTN.setTitle("공유", for: .normal)
        shareBTN.backgroundColor = #colorLiteral(red: 0.359749198, green: 0.5498769879, blue: 0.8033102155, alpha: 1)
//        shareBTN.addTarget(self, action: #selector(goLogin(_ :)), for: .touchUpInside)
        scrollView.addSubview(shareBTN)
        
        heartBTN = UIButton(frame: CGRect(x: shareBTN.frame.maxX + 40, y: numberOfPerson.frame.maxY + 20, width: self.view.frame.size.width / 2 - 40, height: 50))
        heartBTN.layer.borderWidth = 1
        heartBTN.layer.cornerRadius = 8
        heartBTN.setTitle("관심행사", for: .normal)
        heartBTN.backgroundColor = #colorLiteral(red: 0.7896794677, green: 0.2529073358, blue: 0.5402181149, alpha: 1)
//        shareBTN.addTarget(self, action: #selector(goLogin(_ :)), for: .touchUpInside)
        scrollView.addSubview(heartBTN)
        
        pdfView = UIView(frame: CGRect(x: 20, y: heartBTN.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 150))
        pdfView.layer.cornerRadius = 8
        pdfView.layer.borderWidth = 1
        scrollView.addSubview(pdfView)
        
        eventInfoLabel = UILabel(frame: CGRect(x: 20, y: pdfView.frame.maxY + 20 + 10, width: self.view.frame.size.width - 40, height: 30))
        eventInfoLabel.text = "행사정보"
        eventInfoLabel.font = UIFont.systemFont(ofSize: 24)
        scrollView.addSubview(eventInfoLabel)
        
        eventInfo = UILabel(frame: CGRect(x: 30, y: eventInfoLabel.frame.maxY + 20, width: self.view.frame.size.width - 60, height: 50))
        eventInfo.text = "*컨텐츠 \n 컨텐츠 내용이 700px 초과하는 경우 행사 정보 숨김\n 행사정보 더보기 버튼을 통해 나머지 정보 노출\n testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        eventInfo.layer.borderWidth = 1
        eventInfo.numberOfLines = 0
        eventInfo.textColor = .black
        eventInfo.textAlignment = .center
        scrollView.addSubview(eventInfo)
        
        eventDetailBTN = UIButton(frame: CGRect(x: 60, y: eventInfo.frame.maxY + 20, width: self.view.frame.size.width - 120, height: 50))
        eventDetailBTN.layer.borderWidth = 1
        eventDetailBTN.layer.cornerRadius = 8
        eventDetailBTN.layer.borderColor = UIColor.blue.cgColor
        eventDetailBTN.setTitle("행사 정보 더보기", for: .normal)
        eventDetailBTN.setTitleColor(.blue, for: .normal)
        eventDetailBTN.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        eventDetailBTN.addTarget(self, action: #selector(ifHeight(_ :)), for: .touchUpInside)
        scrollView.addSubview(eventDetailBTN)
        
    }
    
    
    @objc func testBtn(_ sender: UIButton) {
        let vc = CreaditViewController()
        
        
        
                vc.imgView = imgView
        
        vc.modalPresentationStyle = .fullScreen
        
//        sceneDel?.window?.rootViewController?.present(vc, animated: true)
        self.present(vc, animated: false)

    }
    
    @objc func ifHeight(_ sender: UIButton) {
        
        if eventInfo.text!.count > 700 {
            print("success")
            eventInfo.frame.size.height = 150
            
            eventDetailBTN.frame.origin.y += 100
            
            
        } else {
            print("fail")
        }
    }
    
    
    
}
