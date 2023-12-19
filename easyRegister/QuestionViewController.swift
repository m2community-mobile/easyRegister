//
//  QuestionViewController.swift
//  easyRegister
//
//  Created by m2comm on 2023/12/12.
//

import Foundation
import UIKit

class QuestionViewController: UIViewController {
    
    var naviBar : UIView!
    
    var eventTitle: UILabel!
    var eventView: UIView!
    var eventName: UILabel!
    var eventTextFiled: UITextField!
    
    var registerBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
        statusBar.backgroundColor = mainColor
        
        self.view.addSubview(statusBar)
        
        naviBar = UIView(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
        naviBar.backgroundColor = .white
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
        
        
        setUI()
        
    }
    
    func setUI() {
        eventTitle = UILabel(frame: CGRect(x: 15, y: naviBar.frame.maxY + 20, width: self.view.frame.size.width - 30, height: 40))
        eventTitle.text = "test"
        eventTitle.font = UIFont.systemFont(ofSize: 22)
    
        self.view.addSubview(eventTitle)
        
        eventView = UIView(frame: CGRect(x: 15, y: eventTitle.frame.maxY + 20, width: self.view.frame.size.width - 30, height: 450))
        eventView.layer.borderWidth = 1
        eventView.layer.cornerRadius = 8
        self.view.addSubview(eventView)
        
        eventName = UILabel(frame: CGRect(x: 15, y: eventView.frame.minY, width: eventView.frame.size.width, height: 60))
        eventName.text = "   test"
        eventName.backgroundColor = #colorLiteral(red: 0.9685639739, green: 0.9799308181, blue: 1, alpha: 1)
        eventName.layer.borderWidth = 1
//        eventName.layer.cornerRadius = 8
        self.view.addSubview(eventName)
        
        eventTextFiled = UITextField(frame: CGRect(x: 15, y: eventName.frame.maxY, width: eventView.frame.size.width, height: 60))
        eventTextFiled.placeholder = "  입력 영역"
        self.view.addSubview(eventTextFiled)
        
        
        registerBTN = UIButton(frame: CGRect(x: 100, y: eventView.frame.maxY + 20, width: self.view.frame.size.width - 200, height: 60))
        registerBTN.setTitle("등록하기", for: .normal)
        registerBTN.setTitleColor(.white, for: .normal)
        registerBTN.backgroundColor = #colorLiteral(red: 0.1316901445, green: 0.6376614571, blue: 0.8334190249, alpha: 1)
        registerBTN.layer.borderWidth = 1
        registerBTN.layer.cornerRadius = 8
        self.view.addSubview(registerBTN)
    }
    

    
    @objc func callMethod(){
        self.dismiss(animated: false)
    }
}
