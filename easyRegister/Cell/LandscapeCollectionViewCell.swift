//
//  LandscapeCollectionViewCell.swift
//  MultiSectionCompositionalLayout
//
//  Created by Emmanuel Okwara on 15.05.22.
//

import UIKit

protocol TestCellDelegate {
    func didPressHeart(for index: Int, like: Bool)
}



final class LandscapeCollectionViewCell: UICollectionViewCell {
    
    
    
    var delegate: TestCellDelegate?
     var index: Int?
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitleLbl: UILabel!
    
    @IBOutlet weak var heartButton: UIButton!
    
    
    @IBAction func heartClick(_ sender: UIButton) {
        guard let idx = index else {return}
        sender.isSelected = !sender.isSelected
                if sender.isSelected {
                    
                    isTouched = true
                    delegate?.didPressHeart(for: idx, like: true)
                    
                    
                    
                    
                }else {
                    isTouched = false
                    delegate?.didPressHeart(for: idx, like: false)
                }
                
    }
    
    var isTouched: Bool? {
            didSet {
                if isTouched == true {
                    heartButton.setImage(UIImage(systemName: "heart.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large)), for: .normal)
                    heartButton.setTitleColor(.red, for: .normal)
                    heartButton.tintColor = .red
                    
//                    heartCount += 1
                    print("\(heartCount)")
                    
                          
                }else{
                    heartButton.setImage(UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(scale: .large)), for: .normal)
                    
                }
            }
        }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        
        cellImageView.image = nil
        cellprinceLbl.text = nil
        cellTitleLbl.text = nil
        
        
    }

    
    @IBOutlet weak var cellprinceLbl: UILabel!
    func setup(_ item: Menu) {
//        cellImageView.image = UIImage(named: item.item[indexPath.row].imgSrc)
        cellTitleLbl.text = item.subTitle
    }
}
