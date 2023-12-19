//
//  HomeViewController.swift
//  easyRegister
//
//  Created by m2comm on 2023/10/18.
//

import Foundation
import UIKit

class categortViewController: UIViewController {
    
    var naviBar : UILabel!
    var naviBarText = "                 Category."
    
    
    var tableView: UITableView = UITableView()

    var categoryList = [CategoryEtc]()
    
    
    

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
        // Do any additional setup after loading the view.
        setTableView()
        
        CategoryDownloadJSON { [self] in
            
            print("success")
            
            
        }
        
        
    }

    
    
    private func CategoryDownloadJSON(completed: @escaping () -> ()){
         let url = URL(string: "https://ezv.kr:4447/shin/json/result_category.json")
        URLSession.shared.dataTask(with: url!){ [self] data, response, err in
             if err == nil{
                 do{
                     let list = try JSONDecoder().decode(CategoryList.self, from: data!)
//                     self.jsonData = list.data.topBanner.banner
                     self.categoryList = list.data.category
                     print("list.data.category\(list.data.category)")
                  
                     
                 }catch{
                     print("error fetching data from api")
                 }
             }
         }.resume()
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
}

extension categortViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell else { return UITableViewCell() }
        cell.row = indexPath.row
        cell.textLabel?.text = categoryList[indexPath.row].title
        print("cellForRowAt: \(indexPath.row)")
        
        return cell
    }
}

extension categortViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let validVC = CategoryCollectionViewController()
        validVC.modalPresentationStyle = .fullScreen
        present(validVC, animated: false, completion: nil)
    }
    
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

extension categortViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print("prefetchRowsAt: \(indexPaths)")
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        print("cancelPrefetchingForRowsAt: \(indexPaths)")
    }
}
