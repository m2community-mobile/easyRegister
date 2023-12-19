//
//  CustomCollectionViewCell.swift
//  easyRegister
//
//  Created by m2comm on 2023/11/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
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
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let height = contentView.frame.size.height
        let width = contentView.frame.size.width
        label.frame = CGRect(x: 5, y: height - 50, width: width - 10, height: 50)
        imageView.frame = CGRect(x: 5, y: 0, width: width - 10, height: height - 50)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        label.text = nil
    }
    
    private func setUI() {
        contentView.backgroundColor = .systemPink
        contentView.addSubview(label)
        contentView.addSubview(imageView)
    }
    
    func configure(with model: ImageModel) {
        label.text = ""
        
    }
}
