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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        print("hellow")
        
        
        img.image = imgView
        
        
        self.view.addSubview(info)
        
        info.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        info.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 40).isActive = true
        info.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        
        testButton.backgroundColor = .yellow
        testButton.setTitle("결제하기", for: .normal)
//        testButton.frame = CGRect(x: 0, y: self.view.frame.maxY - 100, width: self.view.frame.size.width, height: self.view.frame.size.height / 6)
        testButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(testButton)
        testButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        testButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1000).isActive = true
        testButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        testButton.widthAnchor.constraint(equalToConstant: self.view.frame.size.width).isActive = true
        testButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        footer.isHidden = true
        
//        img = UIImageView(frame: CGRect(x: 0, y: naviBar.frame.maxY, width: self.view.frame.width, height: self.view.frame.height / 3))
////        img.backgroundColor = .yellow
//        self.view.addSubview(img)
        
        
        
//        testButton.isHidden = true
        
        
        
        
        
    }
    
}
