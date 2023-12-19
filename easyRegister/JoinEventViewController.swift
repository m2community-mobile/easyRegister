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
        
        tableView = UITableView(frame: CGRect(x: 0, y: naviBar.frame.maxY + 50, width: self.view.frame.size.width, height: self.view.frame.size.height))
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(MyHeartTableViewCell.self, forCellReuseIdentifier: MyHeartTableViewCell.cellId)
        
        
        
        
        
        
    }
    
    
    @objc func callMethod(){
        self.dismiss(animated: false)
    }
    
}


extension JoinEventViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return payImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyHeartTableViewCell.cellId, for: indexPath) as! MyHeartTableViewCell
        
        
        cell.cellImage.image = payImage[indexPath.row] as! UIImage

/*
        
        let url = URL(string: saveArr[indexPath.row] as! String)
//        cell?.imageView?.load(url: url!)
//        cell?.imageView?.loadImage(from: url!.absoluteString)
        
        let data = NSData(contentsOf: url!)
        let img = UIImage(data: data! as Data)
        
//        cell.imageView?.image = img
        
        cell.cellImage.image = img
        cell.cellImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        let itemSize = CGSize(width:200, height:120)
            UIGraphicsBeginImageContextWithOptions(itemSize, false, 0.0)
            let imageRect = CGRect(x:0.0, y:0.0, width:itemSize.width, height:itemSize.height)
//        cell.imageView?.image!.draw(in:imageRect)
//        cell.imageView?.image! = UIGraphicsGetImageFromCurrentImageContext()!
//                UIGraphicsEndImageContext()
        
//        cell?.cellImage.image = img
        
 
 
 */
        
        
        cell.cancelBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        
        
//        cell.cellTitleLabel.text = saveTitle[indexPath.row] as! String
//        cell.textLabel?.text = saveTitle[indexPath.row] as! String
        
        cell.cancelBTN.tag = indexPath.row
        
        cell.contentView.addSubview(cell.modifyBTN)
        cell.contentView.addSubview(cell.cancelBTN)
        cell.contentView.addSubview(cell.qrBTN)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    @objc func test(_ sender: UIButton) {
        print("test")
        
        print("save\(saveArr)")
        
        print("index\(index)")
        payImage.remove(at: sender.tag)
        tableView.deleteRows(at: [IndexPath(row: sender.tag, section: 0)], with: .none)
        
        
//        UserDefaults.standard.set(payImage, forKey: "arr")
//        saveArr = UserDefaults.standard.array(forKey: "arr")!
//
//        print("last>>>\(saveArr)")
//
//        print("last>>>\(saveArr)")
//
////                  arr = (saveArr as? [String])!
//
//        UserDefaults.standard.set(saveArr, forKey: "last")
//
//        var qwiejqlijowejoqeuo = UserDefaults.standard.stringArray(forKey: "last")!
//
//        print("arr-----\(qwiejqlijowejoqeuo)")
        
        
        
    }
}
