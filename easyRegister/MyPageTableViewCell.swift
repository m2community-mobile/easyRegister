//
//  MyPageTableViewCell.swift
//  easyRegister
//
//  Created by m2comm on 2023/11/10.
//

import UIKit

class MyPageTableViewCell: UITableViewCell {
    
    static let identifier: String = "MyCell"
    
    var row: Int?

    override func awakeFromNib() { // 스토리보드 기반, xib등 으로 셀을 다룰 경우에만 호출
        super.awakeFromNib()
        print("awakeFromNib, row:\(row ?? 0)")
    }

    override func prepareForReuse() {
        print("prepareForReuse, row:\(row ?? 0)")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("init, row:\(row ?? 0)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit, row:\(row ?? 0)")
    }

}
