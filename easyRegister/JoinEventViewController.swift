//
//  File.swift
//  easyRegister
//
//  Created by m2comm on 2023/11/14.
//

import Foundation
import UIKit

class JoinEventViewController: UIViewController {
    
    var arrCount: Int!
    var naviBar : UIView!
//    var list = [test.count]
    
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrCount = UserDefaults.standard.integer(forKey: "count")
        
        
        print("savearr\(saveArr)")
        view.backgroundColor = .white
        
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
        
        tableView = UITableView(frame: CGRect(x: 0, y: naviBar.frame.maxY, width: self.view.frame.size.width, height: self.view.frame.size.height))
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        
        
        
        
    }
    @objc func callMethod(){
        self.dismiss(animated: false)
    }
    
}


extension JoinEventViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return saveArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        
        

        
        let url = URL(string: saveArr[indexPath.row] as! String)
        cell?.imageView!.load(url: url!)
        
        
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
    
}



