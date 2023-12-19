//
//  mainTitleCollectionViewCell.swift
//  easyRegister
//
//  Created by m2comm on 2023/10/18.
//

import UIKit



class mainTitleCollectionViewCell: UICollectionViewCell {
    
    let cellTextLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.font = UIFont.italicSystemFont(ofSize: 15)
        return textLabel
    }()
    
    let cellInfoLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.font = UIFont.italicSystemFont(ofSize: 12)
        return textLabel
    }()
    
    var cellHeartButton : UIButton = {
        let heartButton = UIButton()
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        heartButton.setTitleColor(.red, for: .normal)
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        return heartButton
    }()

    
     let img: UIImageView = {
        let imgView = UIImageView()
        
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 10
        self.addSubview(cellTextLabel)
        self.addSubview(img)
        self.addSubview(cellInfoLabel)
        img.addSubview(cellHeartButton)
        
        cellTextLabel.frame = self.bounds
        cellTextLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        cellTextLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        cellTextLabel.topAnchor.constraint(equalTo: img.bottomAnchor).isActive = true
        
        
        
        
        img.frame = self.bounds
        img.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        img.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    // collectionViewCell 사이즈 조절
        img.frame.size.width = 150
        img.frame.size.height = 120
        
        cellInfoLabel.frame = self.bounds
        cellInfoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
