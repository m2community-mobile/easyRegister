//
//  CategoryCollectionViewController.swift
//  easyRegister
//
//  Created by m2comm on 2023/11/22.
//

import Foundation
import UIKit

class CategoryCollectionViewController: UIViewController {
    
    let carouselCollectionView: UICollectionView = {
            
        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .init(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.white

        return collectionView
    }()
    
    var naviBar : UIView!
    var jsonItem = [JsonItem]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJSON { [self] in
            
            print("success")
        }
        
        self.view.backgroundColor = .white
        
        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
        statusBar.backgroundColor = mainColor
        
        self.view.addSubview(statusBar)
        
        naviBar = UIView(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
        naviBar.backgroundColor = .yellow
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
        
        self.view.addSubview(carouselCollectionView)
        
        NSLayoutConstraint.activate([
            carouselCollectionView.topAnchor.constraint(equalTo: naviBar.bottomAnchor, constant: 0),
            carouselCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            carouselCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
//            carouselCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            carouselCollectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
//            carouselCollectionView.heightAnchor.constraint(equalToConstant: 300)

            ])
        
        carouselCollectionView.dataSource = self
        carouselCollectionView.delegate = self
        carouselCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        carouselCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        
        
    }
    
    @objc func callMethod(){
        self.dismiss(animated: false)
    }
    
    private func downloadJSON(completed: @escaping () -> ()){
         let url = URL(string: "https://ezv.kr:4447/shin/json/result_category_result.json")
        URLSession.shared.dataTask(with: url!){ [self] json, response, err in
             if err == nil{
                 do{
                     
                     
                     
                         let category = try JSONDecoder().decode(ExampleJson2KtSwift.self, from: json!)
                         
                         
                         
                         jsonItem = (category.data?.item)!
                     
                     print("zxczxcxz\(jsonItem)")
                         
                     
                         completed()
                         
                                                 
                 } catch  (let error) {
                     
                 }
                     
                     
           
             }
         }.resume()
     }
    
}


extension CategoryCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsonItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell
        
        
        
        
            
            
//            print("\(jsonItem[indexPath.row].imgSrc)")
//            let url = URL(string: jsonItem[indexPath.row].imgSrc!)
//            cell?.cellImage.load(url: url!)
        
        OperationQueue.main.addOperation { [self] in
            cell?.cellImage.sd_setImage(with: URL(string: jsonItem[indexPath.row].imgSrc!), completed: nil)
        }
            
        
        
        
        
        return cell!
    }
}

extension CategoryCollectionViewController: UICollectionViewDelegate {
    
}
extension CategoryCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // code
        return CGSize(width: 200, height: 180)
    }
}
