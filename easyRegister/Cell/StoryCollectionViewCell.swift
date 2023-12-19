//
//  StoryCollectionViewCell.swift
//  MultiSectionCompositionalLayout
//
//  Created by Emmanuel Okwara on 15.05.22.
//

import UIKit

final class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    
    @IBOutlet weak var cellLabel: UILabel!
    
    
    func setup(_ item: Banner) {
        cellImageView.image = UIImage(named: item.imgSrc)
        cellImageView.layoutIfNeeded()
        cellImageView.layer.cornerRadius = cellImageView.frame.height / 2
        
        
        
        cellLabel.layer.borderWidth = 1
        cellLabel.layer.cornerRadius = 20
        cellLabel.backgroundColor = .lightGray
        cellLabel.textColor = .black
        cellLabel.text = "tesrt"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellImageView.image = nil
        
    }
}
