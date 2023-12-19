//
//  File.swift
//  easyRegister
//
//  Created by m2comm on 2023/11/22.
//

import Foundation
import UIKit




struct Whatest: Codable {
    let data: testDataClass
}

// MARK: - DataClass
struct testDataClass: Codable {
    let categoryID, categoryText: String
    let item: [testitem]

    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case categoryText = "category_text"
        case item
    }
}

// MARK: - Item
struct testitem: Codable {
    let id: String
    let eventDate: String
    let likeYn: String
    let imgSrc: String
    let title, subTitle: String
    let discount: String
    let discountCode: String
    let originalPrice, discountPrice: String

    enum CodingKeys: String, CodingKey {
        case id
        case eventDate = "event_date"
        case likeYn = "like_yn"
        case imgSrc = "img_src"
        case title
        case subTitle = "sub_title"
        case discount
        case discountCode = "discount_code"
        case originalPrice = "original_price"
        case discountPrice = "discount_price"
    }
}



struct ImageModel {
    let text: String
    
}

class CollectionViewController: UIViewController {
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.alwaysBounceVertical = true
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        return collectionView
    }()
    var categoryList = [testitem]()
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoryDownloadJSON { [self] in
            
            print("success")
            
            
        }

        setUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    private func setUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func CategoryDownloadJSON(completed: @escaping () -> ()){
         let url = URL(string: "https://ezv.kr:4447/shin/json/result_category_result.json")
        URLSession.shared.dataTask(with: url!){ [self] data, response, err in
             if err == nil{
                 do{
                     let list = try JSONDecoder().decode(Whatest.self, from: data!)
//                     self.jsonData = list.data.topBanner.banner
                     self.categoryList = list.data.item
                     
                  
                     
                 }catch{
                     print("error fetching data from api")
                 }
             }
         }.resume()
     }
}




extension CollectionViewController: UICollectionViewDelegate {
    
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let number = (1...10).randomElement() {
            let text = categoryList.daat
            
            let model = ImageModel(text: text)
            cell.configure(with: model)
            
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width / 3
        return CGSize(width: 200, height: 180)
    }
}
