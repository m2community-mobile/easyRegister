//
//  MyPageTableViewController.swift
//  easyRegister
//
//  Created by m2comm on 2023/11/10.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {
    
    var naviBar : UILabel!
    var naviBarText = "                 Setting."
    
    
    var tableView: UITableView = UITableView()

    let data = ["회원정보 수정", "알림 설정", "이용약관", "회원탈퇴", "로그아웃"]

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
        
        
        
        // Do any additional setup after loading the view.
        setTableView()
        
        
    }
    
    func setTableView() {
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.delegate = self
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        
//        tableView = UITableView(frame: CGRect(x: 0, y: naviBar.frame.maxY, width: self.view.frame.size.width, height: 100))
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: naviBar.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    @objc func callMethod(){
        self.dismiss(animated: false)
    }
}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell else { return UITableViewCell() }
        cell.row = indexPath.row
        cell.textLabel?.text = data[indexPath.row]
        print("cellForRowAt: \(indexPath.row)")
        
        return cell
    }
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("willDisplay: \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("didEndDisplaying: \(indexPath.row)")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension SettingViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print("prefetchRowsAt: \(indexPaths)")
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        print("cancelPrefetchingForRowsAt: \(indexPaths)")
    }
}

