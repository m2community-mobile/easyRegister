//
//   secessionViewController.swift
//  easyRegister
//
//  Created by m2comm on 2023/11/18.
//

import Foundation
import UIKit

class  secessionViewController: UIViewController {
    
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
    
    var basicView: UIView!
    var basicImage: UIImageView!
    var basicLabel: UILabel!
    
    var detailView: UIView!
    var detailLabel: UILabel!
    
    var agreeBTN: UIButton!
    var agreeLabel: UILabel!
    
    var myCheckLabel: UILabel!
    var myCheckinfoLabel: UILabel!
    var myCheckTF: UITextField!
    var myCheckBTN: UIButton!
    var myCheckRed1Label: UILabel!
    var myCheckRed2Label: UILabel!
    var byeBTN:UIButton!
    
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
        labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1000).isActive = true
        labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
        
        basicView = UIView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: self.view.frame.size.width, height: self.view.frame.size.height / 2.5))
        basicView.backgroundColor = #colorLiteral(red: 0.8509745002, green: 0.8916379213, blue: 1, alpha: 1)
        scrollView.addSubview(basicView)
        
        basicImage = UIImageView(frame: CGRect(x: 20, y: 20, width: basicView.frame.size.width - 40 , height: basicView.frame.size.height / 3))
        basicImage.image = UIImage(systemName: "heart")
        basicView.addSubview(basicImage)
        
        basicLabel = UILabel(frame: CGRect(x: 20, y: basicImage.frame.maxY, width: self.view.frame.size.width - 40, height: basicView.frame.size.height / 2))
        basicLabel.text = "그동안 Easy Register를 이용해주셔서 감사합니다.\n\n 회원탈퇴를 신청하시기 전에\n 아래안내 사항을 한번 더 확인해주세요."
        basicLabel.textAlignment = .center
        basicLabel.numberOfLines = 0
        basicView.addSubview(basicLabel)
        
        detailView = UIView(frame: CGRect(x: 40, y: basicView.frame.maxY - naviBar.frame.size.height, width: self.view.frame.size.width - 80, height: self.view.frame.size.height / 3))
//        detailView.backgroundColor = #colorLiteral(red: 0.9764431119, green: 0.9839504361, blue: 1, alpha: 1)
        detailView.layer.cornerRadius = 8
        detailView.backgroundColor = #colorLiteral(red: 0.9764431119, green: 0.9839504361, blue: 1, alpha: 1)
        scrollView.addSubview(detailView)
        
        detailLabel = UILabel(frame: CGRect(x: detailView.frame.minX, y: detailView.frame.minY, width: self.view.frame.size.width - 40, height: detailView.frame.size.height))
        detailLabel .font = UIFont.systemFont(ofSize: 14)
        detailLabel.text =  """
- 회원탈퇴 신청 시, 회원님 이메일 아이디로 즉시\n 탈퇴 처리가 진행 됩니다.

- 회원가입 시, 입력한 회원정보는 모두 삭제 됩니다.

- 회원탈퇴가 완료된 이메일은 본인을\n 포함한 타인 모두 재사용이나 복구가 불가능 합니다.

- 회원탈퇴 완료 후, 삭제된 행사와\n 접수내역의 데이터는 복구되지 않습니다.

- 개설한 행사나 참가한 행사 중에 \n 진행중인 행사가 있을 시, 탈퇴가 불가능합니다.
행사 내역 삭제나 취소 후에 탈퇴 부탁드립니다.
"""
        detailLabel.textAlignment = .left
        detailLabel.numberOfLines = 0
        scrollView.addSubview(detailLabel)
        
        agreeBTN = UIButton(frame: CGRect(x: detailView.frame.minX, y: detailView.frame.maxY + 10, width: self.view.frame.size.width, height: 20))
        agreeBTN.setTitle(" 안내사항을 모두 확인하였으며, 이에 동의합니다.", for: .normal)
        agreeBTN.backgroundColor = .white
        agreeBTN.setTitleColor(.black, for: .normal)
        agreeBTN.contentHorizontalAlignment = .left
        agreeBTN.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        agreeBTN.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        agreeBTN.tag = 0
        
        agreeBTN.addTarget(self, action: #selector(agreeBTNAC(_ :)), for: .touchUpInside)
        scrollView.addSubview(agreeBTN)
        
        
        agreeLabel = UILabel(frame: CGRect(x: detailView.frame.minX, y: agreeBTN.frame.maxY, width: self.view.frame.size.width - 80, height: 20))
        
        agreeLabel.font = UIFont.systemFont(ofSize: 13)
        agreeLabel.textColor = .red
        agreeLabel.text = "탈퇴 안내 사항에 동의해주세요."
        agreeLabel.textAlignment = .left
        agreeLabel.numberOfLines = 0
        scrollView.addSubview(agreeLabel)
        
        let agreeUnderBar = UIView(frame: CGRect(x: detailView.frame.minX, y: agreeLabel.frame.maxY + 20, width: SCREEN.WIDTH - 80, height: 0.5))
        agreeUnderBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.8)
        scrollView.addSubview(agreeUnderBar)
        
        
        myCheckLabel = UILabel(frame: CGRect(x: detailView.frame.minX, y: agreeUnderBar.frame.maxY + 20, width: self.view.frame.size.width - 80, height: 20))
        
        myCheckLabel.font = UIFont.systemFont(ofSize: 22)
        myCheckLabel.text = "본인 확인"
        myCheckLabel.textAlignment = .center
        myCheckLabel.numberOfLines = 0
        scrollView.addSubview(myCheckLabel)
        
        myCheckinfoLabel = UILabel(frame: CGRect(x: detailView.frame.minX, y: myCheckLabel.frame.maxY + 5, width: self.view.frame.size.width - 80, height: 40))
        
        myCheckinfoLabel.font = UIFont.systemFont(ofSize: 12)
        myCheckinfoLabel.text = "탈퇴하는 본인이 맞는지 확인이 필요합니다.\n 현재 사용중인 비밀번호 입력 후 회원탈퇴를 진행해주세요."
        myCheckinfoLabel.textColor = .lightGray
        myCheckinfoLabel.textAlignment = .center
        myCheckinfoLabel.numberOfLines = 0
        scrollView.addSubview(myCheckinfoLabel)

        
        myCheckTF = UITextField(frame: CGRect(x: 60, y: myCheckinfoLabel.frame.maxY + 5, width: self.view.frame.size.width - 120, height: 40))
        myCheckTF.placeholder = ""
        myCheckTF.layer.borderWidth = 1
        myCheckTF.layer.cornerRadius = 8
        //        nameTf.layer.addBorder([.bottom], color: .lightGray, width: 1)
        scrollView.addSubview(myCheckTF)
        
        myCheckRed1Label = UILabel(frame: CGRect(x: detailView.frame.minX, y: myCheckTF.frame.maxY + 5, width: self.view.frame.size.width - 80, height: 20))
        myCheckRed1Label.textColor = .red
        myCheckRed1Label.font = UIFont.systemFont(ofSize: 12)
        myCheckRed1Label.text = "비밀번호를 확인해주세요."
        myCheckRed1Label.textAlignment = .left
        myCheckRed1Label.numberOfLines = 0
        scrollView.addSubview(myCheckRed1Label)
        
        
        myCheckRed2Label = UILabel(frame: CGRect(x: detailView.frame.minX, y: myCheckRed1Label.frame.maxY, width: self.view.frame.size.width - 80, height: 40))
        myCheckRed2Label.textColor = .red
        myCheckRed2Label.font = UIFont.systemFont(ofSize: 12)
        myCheckRed2Label.text = "현재 진행중인 행사가 있습니다.\n신청 내역을 모두 취소 후 탈퇴를 진행해주세요."
        myCheckRed2Label.textAlignment = .left
        myCheckRed2Label.numberOfLines = 0
        scrollView.addSubview(myCheckRed2Label)
        
        
        byeBTN = UIButton(frame: CGRect(x: detailView.frame.minX + 80, y: myCheckRed2Label.frame.maxY + 25, width: self.view.frame.size.width - 240, height: 45))
        byeBTN.setTitle("회원탈퇴", for: .normal)
        byeBTN.backgroundColor = .red
        byeBTN.setTitleColor(.white, for: .normal)
        byeBTN.contentHorizontalAlignment = .center
        byeBTN.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        byeBTN.tag = 0
        
//        agreeBTN.addTarget(self, action: #selector(agreeBTNAC(_ :)), for: .touchUpInside)
        scrollView.addSubview(byeBTN)
    }
    
    @objc func callMethod(){
        self.dismiss(animated: false)
    }
    
    @objc func agreeBTNAC(_ sender: UIButton){
        selected = !selected
        if selected {
            agreeBTN.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        } else {
            agreeBTN.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        }
    }
    
}
