//
//  MyHeartTableViewCell.swift
//  easyRegister
//
//  Created by m2comm on 2023/12/01.
//

import UIKit

class MyHeartTableViewCell: UITableViewCell {

    static let cellId = "joinCell"
    
    var cellImage: UIImageView!
    var cellTitleLabel: UILabel!
    var modifyBTN: UIButton!
    var cancelBTN: UIButton!
    var qrBTN: UIButton!
   
   
  
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.cellImage = UIImageView(frame: CGRect(x: 20, y: 20, width: 160, height: 100))
        self.addSubview(cellImage)
        
        self.cellTitleLabel = UILabel(frame: CGRect(x: cellImage.frame.maxX + 10, y: 20, width: 200, height: 40))
        self.cellTitleLabel.numberOfLines = 0
        self.cellTitleLabel.font = UIFont.systemFont(ofSize: 16)
        
        self.addSubview(cellTitleLabel)
        
        self.modifyBTN = UIButton(frame: CGRect(x: 20, y: cellImage.frame.maxY + 30, width: 175, height: 45))
        self.modifyBTN.setTitle("수정", for: .normal)
        self.modifyBTN.setTitleColor(.black, for: .normal)
        self.modifyBTN.layer.borderWidth = 1
        self.modifyBTN.layer.cornerRadius = 8
        self.modifyBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        self.addSubview(modifyBTN)
        
        self.cancelBTN = UIButton(frame: CGRect(x: modifyBTN.frame.maxX + 10, y: cellImage.frame.maxY + 30, width: 175, height: 45))
        self.cancelBTN.setTitle("취소", for: .normal)
        self.cancelBTN.setTitleColor(.black, for: .normal)
        self.cancelBTN.layer.borderWidth = 1
        self.cancelBTN.layer.cornerRadius = 8
        self.cancelBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        self.addSubview(cancelBTN)
        
        self.qrBTN = UIButton(frame: CGRect(x: 20, y: cancelBTN.frame.maxY + 10, width: cellImage.frame.size.width + cellTitleLabel.frame.size.width, height: 45))
        self.qrBTN.setTitle("QR 출결", for: .normal)
        self.qrBTN.setTitleColor(.black, for: .normal)
        self.qrBTN.layer.borderWidth = 1
        self.qrBTN.layer.cornerRadius = 8
        self.qrBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        self.addSubview(qrBTN)
        
        
    }
    @objc func test(_ sender: UIButton) {
        print("test")
        
        let vc = LoginNoramlViewController()
        
        vc.modalPresentationStyle = .fullScreen
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
 
    

}
