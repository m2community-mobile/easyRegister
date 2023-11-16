//
//  CarouselCollectionViewCell.swift
//  CarouselEffect
//
//  Created by woong on 12/05/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit



class CarouselCollectionViewCell: UICollectionViewCell {
    
    let cellTextLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.font = UIFont.italicSystemFont(ofSize: 30)
        return textLabel
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
        
        cellTextLabel.frame = self.bounds
        cellTextLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cellTextLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        
        img.frame = self.bounds
        img.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        img.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
