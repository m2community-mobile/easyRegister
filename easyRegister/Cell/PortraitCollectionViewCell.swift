//
//  PortraitCollectionViewCell.swift
//  MultiSectionCompositionalLayout
//
//  Created by Emmanuel Okwara on 15.05.22.
//

import UIKit

final class PortraitCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitleLbl: UILabel!
    
    func setup(_ item: DataClass) {
//        cellImageView.image = UIImage(named: item.imgSrc)
        cellTitleLbl.text = "test"
       
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        cellTitleLbl.text = ""
        cellImageView.image = nil
    }
    
   
    
}
