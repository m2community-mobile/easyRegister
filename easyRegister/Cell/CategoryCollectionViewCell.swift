//
//  CategoryCollectionViewCell.swift
//  easyRegister
//
//  Created by m2comm on 2023/11/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    var cellTextLabel: UILabel!
    var cellImage: UIImageView!
    
    private let label: UILabel = {
           let label = UILabel()
           label.textColor = .label
           label.font = .systemFont(ofSize: 12, weight: .bold)
           label.numberOfLines = 0
           label.textAlignment = .center
           return label
       }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cellImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        self.addSubview(cellImage)
    }
    
    override func prepareForReuse() {
//        cellImage.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
