//
//  DetailedViewController.swift
//  easyRegister
//
//  Created by m2comm on 2023/10/23.
//

import Foundation
import UIKit
import GoogleMaps


class DetailedViewController: BaseViewController, GMSMapViewDelegate {
    
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
    
    var palceInfoLabel: UILabel!
    var placeInfo : UILabel!
    var placeMap : UIView!
    var mapView: GMSMapView!
    var myMarker = GMSMarker()
    let locationManager = CLLocationManager()
    
    var programInfoLabel: UILabel!
    var programInfo : UILabel!
    var programDetailBTN: UIButton!
    
    var questionLabel: UILabel!
    var questionLogo: UIImageView!
    var noQuetion: UILabel!
    var haveQuestionLabel: UILabel!
    var questionRegisterBTN: UIButton!
        var haveQuestionView: UIView!
    var questionName: UILabel!
    var Questionstring: UILabel!
    var questionAddBTN: UIButton!
    
    var cancelLabel: UILabel!
    var cancelView: UIView!
    
    
    
    var eventDetailUnderBar: UIView!
    var mapUnderBar: UIView!
    var programUnderBar: UIView!
    var questionUnderBar: UIView!
    
    
    var isChecked = true
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageSet()
        
        
        scrollView.addSubview(eventDetailBTN)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.delegate = self
//        
//        // 사용할때만 위치정보를 사용한다는 팝업이 발생
//        locationManager.requestWhenInUseAuthorization()
//        
//        // 항상 위치정보를 사용한다는 판업이 발생
//        locationManager.requestAlwaysAuthorization()
//        
//        locationManager.startUpdatingLocation()
        
        move(at: locationManager.location?.coordinate)
        
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
        
        
        textIn = UILabel(frame: CGRect(x: 40, y: eventLabel.frame.maxY + 20, width: self.view.frame.size.width - 80, height: 20))
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
        
        
        //여기 넣기
        //dateString 3
        startDate.text = dateString
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
        shareBTN.addTarget(self, action: #selector(shareAction(_ :)), for: .touchUpInside)
        scrollView.addSubview(shareBTN)
        
        heartBTN = UIButton(frame: CGRect(x: shareBTN.frame.maxX + 40, y: numberOfPerson.frame.maxY + 20, width: self.view.frame.size.width / 2 - 40, height: 50))
        heartBTN.layer.borderWidth = 1
        heartBTN.layer.cornerRadius = 8
        heartBTN.setTitle("관심행사", for: .normal)
        heartBTN.backgroundColor = #colorLiteral(red: 0.7896794677, green: 0.2529073358, blue: 0.5402181149, alpha: 1)
//        shareBTN.addTarget(self, action: #selector(goLogin(_ :)), for: .touchUpInside)
        scrollView.addSubview(heartBTN)
        
        let firstnUnderBar = UIView(frame: CGRect(x: 0, y: heartBTN.frame.maxY + 20, width: SCREEN.WIDTH, height: 10))
        firstnUnderBar.backgroundColor = #colorLiteral(red: 0.941077292, green: 0.9563028216, blue: 0.9817754626, alpha: 1)
        scrollView.addSubview(firstnUnderBar)
        
        pdfView = UIView(frame: CGRect(x: 20, y: firstnUnderBar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 150))
        pdfView.layer.cornerRadius = 8
        pdfView.layer.borderWidth = 1
        scrollView.addSubview(pdfView)
        
        eventInfoLabel = UILabel(frame: CGRect(x: 20, y: pdfView.frame.maxY + 20 + 10, width: self.view.frame.size.width - 40, height: 30))
        eventInfoLabel.text = "행사정보"
        eventInfoLabel.font = UIFont.systemFont(ofSize: 24)
        scrollView.addSubview(eventInfoLabel)
        
        eventInfo = UILabel(frame: CGRect(x: 30, y: eventInfoLabel.frame.maxY + 20, width: self.view.frame.size.width - 60, height: 50))
        eventInfo.text = "*컨텐츠 \n 컨텐츠 내용이 700px 초과하는 경우 행사 정보 숨김\n 행사정보 더보기 버튼을 통해 나머지 정보 노출\n testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
//        eventInfo.layer.borderWidth = 1
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
        
        eventDetailUnderBar = UIView(frame: CGRect(x: 0, y: eventDetailBTN.frame.maxY + 20, width: SCREEN.WIDTH, height: 10))
        eventDetailUnderBar.backgroundColor = #colorLiteral(red: 0.941077292, green: 0.9563028216, blue: 0.9817754626, alpha: 1)
        scrollView.addSubview(eventDetailUnderBar)
        
        palceInfoLabel = UILabel(frame: CGRect(x: 20, y: eventDetailUnderBar.frame.maxY + 20 + 10, width: self.view.frame.size.width - 40, height: 30))
        palceInfoLabel.text = "행사장소"
        palceInfoLabel.font = UIFont.systemFont(ofSize: 24)
        scrollView.addSubview(palceInfoLabel)
     
        placeInfo = UILabel(frame: CGRect(x: 20, y: palceInfoLabel.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 30))
        placeInfo.text = "장소텍스트"
        placeInfo.font = UIFont.systemFont(ofSize: 15)
        scrollView.addSubview(placeInfo)

//        mapView = UIView(frame: CGRect(x: 20, y: placeInfo.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 250))
        mapView = GMSMapView(frame: CGRect(x: 20, y: placeInfo.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 250))
        mapView.backgroundColor = .yellow
        scrollView.addSubview(mapView)
        
        
//        placeMap = UIView(frame: CGRect(x: 20, y: placeInfo.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 250))
//        placeMap.backgroundColor = .yellow
//        scrollView.addSubview(placeMap)
        
        mapUnderBar = UIView(frame: CGRect(x: 0, y: mapView.frame.maxY + 20, width: SCREEN.WIDTH, height: 10))
        mapUnderBar.backgroundColor = #colorLiteral(red: 0.941077292, green: 0.9563028216, blue: 0.9817754626, alpha: 1)
        scrollView.addSubview(mapUnderBar)
        
        programInfoLabel = UILabel(frame: CGRect(x: 20, y: mapUnderBar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 30))
        programInfoLabel.text = "프로그램"
        programInfoLabel.font = UIFont.systemFont(ofSize: 24)
        scrollView.addSubview(programInfoLabel)
        
        programInfo = UILabel(frame: CGRect(x: 30, y: programInfoLabel.frame.maxY + 20, width: self.view.frame.size.width - 60, height: 50))
        programInfo.text = "*컨텐츠 \n 컨텐츠 내용이 700px 초과하는 경우 행사 정보 숨김\n 행사정보 더보기 버튼을 통해 나머지 정보 노출\n testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
//        programInfo.layer.borderWidth = 1
        programInfo.numberOfLines = 0
        programInfo.textColor = .black
        programInfo.textAlignment = .center
        scrollView.addSubview(programInfo)
        
        
        programDetailBTN = UIButton(frame: CGRect(x: 60, y: programInfo.frame.maxY + 20, width: self.view.frame.size.width - 120, height: 50))
        programDetailBTN.layer.borderWidth = 1
        programDetailBTN.layer.cornerRadius = 8
        programDetailBTN.layer.borderColor = UIColor.blue.cgColor
        programDetailBTN.setTitle("프로그램 정보 더보기", for: .normal)
        programDetailBTN.setTitleColor(.blue, for: .normal)
        programDetailBTN.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        programDetailBTN.addTarget(self, action: #selector(programIfHeight(_ :)), for: .touchUpInside)
        scrollView.addSubview(programDetailBTN)
        
        programUnderBar = UIView(frame: CGRect(x: 0, y: programDetailBTN.frame.maxY + 20, width: SCREEN.WIDTH, height: 10))
        programUnderBar.backgroundColor = #colorLiteral(red: 0.941077292, green: 0.9563028216, blue: 0.9817754626, alpha: 1)
        scrollView.addSubview(programUnderBar)
        
        questionLabel = UILabel(frame: CGRect(x: 20, y: programUnderBar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 30))
        questionLabel.text = "문의"
        questionLabel.font = UIFont.systemFont(ofSize: 24)
        scrollView.addSubview(questionLabel)
        
        questionLogo = UIImageView(frame: CGRect(x: self.view.frame.width / 2.2, y: questionLabel.frame.maxY + 20, width: 50, height: 50))
        questionLogo.image = UIImage(named: "question")
        scrollView.addSubview(questionLogo)
        
        
        noQuetion = UILabel(frame: CGRect(x: self.view.frame.width / 3, y: questionLogo.frame.maxY + 20, width: 150, height: 30))
        noQuetion.text = "등록된 문의가 없습니다."
        noQuetion.font = UIFont.systemFont(ofSize: 15)
        scrollView.addSubview(noQuetion)
        
        questionRegisterBTN = UIButton(frame: CGRect(x: 100, y: noQuetion.frame.maxY + 20, width: self.view.frame.size.width - 200, height: 50))
        questionRegisterBTN.setTitle("문의하기", for: .normal)
        questionRegisterBTN.backgroundColor = #colorLiteral(red: 0.2591650486, green: 0.3022328615, blue: 0.4413176775, alpha: 1)
        questionRegisterBTN.addTarget(self, action: #selector(goRegister(_ :)), for: .touchUpInside)
        scrollView.addSubview(questionRegisterBTN)
        
        haveQuestionView = UIView(frame: CGRect(x: 20, y: questionRegisterBTN.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 100))
        haveQuestionView.backgroundColor = #colorLiteral(red: 0.9685639739, green: 0.9799308181, blue: 1, alpha: 1)
        scrollView.addSubview(haveQuestionView)
        
        questionName = UILabel(frame: CGRect(x: 20, y: 20, width: haveQuestionView.frame.size.width - 40, height: 20))
        questionName.text = "홍길동"
        haveQuestionView.addSubview(questionName)
        
        Questionstring = UILabel(frame: CGRect(x: 20, y: questionName.frame.maxY + 10, width: haveQuestionView.frame.size.width - 40, height: 20))
        Questionstring.text = "문의합니다."
        haveQuestionView.addSubview(Questionstring)
        
        
        questionAddBTN = UIButton(frame: CGRect(x: 100, y: haveQuestionView.frame.maxY + 20, width: self.view.frame.size.width - 200, height: 50))
        questionAddBTN.setTitle("문의더보기", for: .normal)
        questionAddBTN.setTitleColor(.blue, for: .normal)
        questionAddBTN.layer.borderWidth = 1
        questionAddBTN.layer.cornerRadius = 8
        questionAddBTN.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        questionAddBTN.layer.borderColor = UIColor.blue.cgColor
        questionAddBTN.addTarget(self, action: #selector(addView(_ :)), for: .touchUpInside)
        scrollView.addSubview(questionAddBTN)
        
        questionUnderBar = UIView(frame: CGRect(x: 0, y: questionAddBTN.frame.maxY + 20, width: SCREEN.WIDTH, height: 10))
        questionUnderBar.backgroundColor = #colorLiteral(red: 0.941077292, green: 0.9563028216, blue: 0.9817754626, alpha: 1)
        scrollView.addSubview(questionUnderBar)
        
        cancelLabel = UILabel(frame: CGRect(x: 20, y: questionUnderBar.frame.maxY + 20, width: haveQuestionView.frame.size.width - 40, height: 30))
        cancelLabel.text = "취소 및 환불규정"
        cancelLabel.font = UIFont.systemFont(ofSize: 24)
        scrollView.addSubview(cancelLabel)
        
        cancelView = UIView(frame: CGRect(x: 20, y: cancelLabel.frame.maxY + 20, width: self.view.frame.size.width - 40, height: 100))
        cancelView.backgroundColor = #colorLiteral(red: 0.9685639739, green: 0.9799308181, blue: 1, alpha: 1)
        scrollView.addSubview(cancelView)
        
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: naviBar.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: cancelView.bottomAnchor, constant: 300).isActive = true


        scrollView.addSubview(labelTwo)
        labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 3000).isActive = true
        labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
        
        
    }
    
    @objc func shareAction(_ sender: UIButton) {
        // UIActivityViewController를 생성할때, activityItems에 배열안에 url을 담아준다.
        // url은 공유할 게시물의 딥링크를 넣어주면 된다.
        // 추후에 딥링크를 생성할 것이므로 일단 url이라고 쓰겠다.
        
        let url = "www.naver.com"

        let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)

        // 제외할 액티비티 타입들이다.
        // .을 찍어보면 다양한 옵션들이 나온다. 그중에서 필요없는 것은 제외하도록 하자.
        activityViewController.excludedActivityTypes = [.addToReadingList, .assignToContact, .saveToCameraRoll, .markupAsPDF]

        // 액티비티의 작업이 끝났을때 동작하는 컴플리션핸들러이다.
        activityViewController.completionWithItemsHandler = { (activity, success, items, error) in
            if success {
            // 성공했을 때 작업
           }  else  {
            // 실패했을 때 작업
           }
        }

        // 만들어놓은 액티비티 뷰를 present로 띄워준다.
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
    
    @objc func testBtn(_ sender: UIButton) {
        let vc = CreaditViewController()
        
        
        
                vc.imgView = imgView
        vc.eventTextString = textString
        
        vc.nameString = textString
        
        //일시 보내주기 2
        vc.testString = dateString
        
        vc.modalPresentationStyle = .fullScreen
        
//        sceneDel?.window?.rootViewController?.present(vc, animated: true)
        self.present(vc, animated: false)

    }
    
    @objc func ifHeight(_ sender: UIButton) {
        
        
                if isChecked {
                    
                    
                    
                    eventInfo.frame.size.height = 600
                    
                    eventDetailBTN.frame.origin.y = eventInfo.frame.maxY + 20
                    
                    eventDetailUnderBar.frame.origin.y = eventDetailBTN.frame.maxY + 20
                    
                    palceInfoLabel.frame.origin.y = eventDetailUnderBar.frame.maxY + 20 + 10
                    
                    placeInfo.frame.origin.y = palceInfoLabel.frame.maxY + 20 + 10
                    
                    mapView.frame.origin.y = placeInfo.frame.maxY + 20
                    
                    mapUnderBar.frame.origin.y = mapView.frame.maxY + 20
                    
                    programInfoLabel.frame.origin.y = mapUnderBar.frame.maxY + 20
                    
                    programInfo.frame.origin.y = programInfoLabel.frame.maxY + 20
                    
                    programDetailBTN.frame.origin.y = programInfo.frame.maxY + 20
                    
                    programUnderBar.frame.origin.y = programDetailBTN.frame.maxY + 20
                    
                    questionLabel.frame.origin.y = programUnderBar.frame.maxY + 20
                    
                    questionLogo.frame.origin.y = questionLabel.frame.maxY + 20
                    
                    noQuetion.frame.origin.y = questionLogo.frame.maxY + 20
                    
                    questionRegisterBTN.frame.origin.y = noQuetion.frame.maxY + 20
                    
                    haveQuestionView.frame.origin.y = questionRegisterBTN.frame.maxY + 20
                    
                    questionAddBTN.frame.origin.y = haveQuestionView.frame.maxY + 20
                    
                    questionUnderBar.frame.origin.y = questionAddBTN.frame.maxY + 20
                    
                    cancelLabel.frame.origin.y = questionUnderBar.frame.maxY + 20
                    
                    cancelView.frame.origin.y = cancelLabel.frame.maxY + 20
                } else {
                    eventInfo.frame.size.height = 50
                    
                    eventDetailBTN.frame.origin.y = eventInfo.frame.maxY + 20
                    
                    eventDetailUnderBar.frame.origin.y = eventDetailBTN.frame.maxY + 20
                    
                    palceInfoLabel.frame.origin.y = eventDetailUnderBar.frame.maxY + 20 + 10
                    
                    placeInfo.frame.origin.y = palceInfoLabel.frame.maxY + 20
                    
                    mapView.frame.origin.y = placeInfo.frame.maxY + 20
                    
                    mapUnderBar.frame.origin.y = mapView.frame.maxY + 20
                    
                    programInfoLabel.frame.origin.y = mapUnderBar.frame.maxY + 20
                    
                    programInfo.frame.origin.y = programInfoLabel.frame.maxY + 20
                    
                    programDetailBTN.frame.origin.y = programInfo.frame.maxY + 20
                    
                    programUnderBar.frame.origin.y = programDetailBTN.frame.maxY + 20
                    
                    questionLabel.frame.origin.y = programUnderBar.frame.maxY + 20
                    
                    questionLogo.frame.origin.y = questionLabel.frame.maxY + 20
                    
                    noQuetion.frame.origin.y = questionLogo.frame.maxY + 20
                    
                    questionRegisterBTN.frame.origin.y = noQuetion.frame.maxY + 20
                    
                    haveQuestionView.frame.origin.y = questionRegisterBTN.frame.maxY + 20
                    
                    questionAddBTN.frame.origin.y = haveQuestionView.frame.maxY + 20
                    
                    questionUnderBar.frame.origin.y = questionAddBTN.frame.maxY + 20
                    
                    cancelLabel.frame.origin.y = questionUnderBar.frame.maxY + 20
                    
                    cancelView.frame.origin.y = cancelLabel.frame.maxY + 20
                }
        
        isChecked = !isChecked
        
//        if eventInfo.text!.count > 700 {
//            print("success")
//            eventInfo.frame.size.height = 600
//
//            eventDetailBTN.frame.origin.y = eventInfo.frame.maxY + 20
//
//        }
//
        
        
    }
    
    @objc func programIfHeight(_ sender: UIButton) {
        
        
                if isChecked {
                    
                    
                    
                    programInfo.frame.size.height = 600
                    
                    programDetailBTN.frame.origin.y = programInfo.frame.maxY + 20
                    
                    programUnderBar.frame.origin.y = programDetailBTN.frame.maxY + 20
                    
                    questionLabel.frame.origin.y = programUnderBar.frame.maxY + 20
                    
                    questionLogo.frame.origin.y = questionLabel.frame.maxY + 20
                    
                    noQuetion.frame.origin.y = questionLogo.frame.maxY + 20
                    
                    questionRegisterBTN.frame.origin.y = noQuetion.frame.maxY + 20
                    
                    haveQuestionView.frame.origin.y = questionRegisterBTN.frame.maxY + 20
                    
                    questionAddBTN.frame.origin.y = haveQuestionView.frame.maxY + 20
                    
                    questionUnderBar.frame.origin.y = questionAddBTN.frame.maxY + 20
                    
                    cancelLabel.frame.origin.y = questionUnderBar.frame.maxY + 20
                    
                    cancelView.frame.origin.y = cancelLabel.frame.maxY + 20
                   
                } else {
                    programInfo.frame.size.height = 50
                    
                    programDetailBTN.frame.origin.y = programInfo.frame.maxY + 20
                    
                    programUnderBar.frame.origin.y = programDetailBTN.frame.maxY + 20
                    
                    questionLabel.frame.origin.y = programUnderBar.frame.maxY + 20
                    
                    questionLogo.frame.origin.y = questionLabel.frame.maxY + 20
                    
                    noQuetion.frame.origin.y = questionLogo.frame.maxY + 20
                    
                    questionRegisterBTN.frame.origin.y = noQuetion.frame.maxY + 20
                    
                    haveQuestionView.frame.origin.y = questionRegisterBTN.frame.maxY + 20
                    
                    questionAddBTN.frame.origin.y = haveQuestionView.frame.maxY + 20
                    
                    questionUnderBar.frame.origin.y = questionAddBTN.frame.maxY + 20
                    
                    cancelLabel.frame.origin.y = questionUnderBar.frame.maxY + 20
                    
                    cancelView.frame.origin.y = cancelLabel.frame.maxY + 20
                }
        
        
        isChecked = !isChecked

        
    }

    @objc func goRegister(_ sender: UIButton) {
        let vc = QuestionViewController()
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
        
        vc.eventTitle.text = textString
    }
    
    @objc func addView(_ sender: UIButton) {
//        if isChecked {
//        } else {
//        }
//        isChecked = !isChecked
    }
    
    
}


extension DetailedViewController {
    func move(at coordinate: CLLocationCoordinate2D?) {
        guard let coordinate = coordinate else {
            return
        }
        
        print("move = \(coordinate)")
        
        let latitude = coordinate.latitude
        let longitude = coordinate.longitude
        
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 14.0)
        mapView.camera = camera
        
        myMarker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        myMarker.title = "My Position"
        myMarker.snippet = "Known"
        myMarker.map = mapView
    }
}
 
extension DetailedViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let firstLocation = locations.first else {
            return
        }
        
        move(at: firstLocation.coordinate)
    }
}
