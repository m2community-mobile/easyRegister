//
//  TestViewController.swift
//  easyRegister
//
//  Created by m2comm on 2023/11/09.
//

import Foundation
import UIKit

class TestViewController: UIViewController {
    
    // MARK: - Property
//    let palette: [UIColor] = [.red, .orange, .yellow, .green, .blue, .red, .orange, .yellow, .green, .blue, .red, .orange, .yellow, .green, .blue, .red, .orange, .yellow, .green, .blue]

    var img:UIImage!
    
    // MARK: - View
    private var collectionView: UICollectionView?
    
    // MARK: - View Life Cycle
    override func loadView() {
        let view = UIView()
        self.view = view
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .init(), collectionViewLayout: flowLayout)
        self.collectionView = collectionView
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        
        collectionView?.reloadData()
        
        
    }
    
    // MARK: - func
    func initialize() {
        // MARK: collectionView register 추가
        collectionView?.register(Cell.self, forCellWithReuseIdentifier: "\(Cell.self)")
        
        // MARK: delegate, dataSource 추가
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
}


// MARK: - extension
extension TestViewController: UICollectionViewDataSource {
    // MARK: cell count
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    // MARK: cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(Cell.self)", for: indexPath) as? Cell else {
            return UICollectionViewCell()
        }
        
        
        var imageview:UIImageView=UIImageView(frame: CGRect(x: 50, y: 50, width: 200, height: 200));

                var img : UIImage? = img
                imageview.image = pic

                cell.contentView.addSubview(imageview)
        
        
        
        return cell
    }
}

extension TestViewController: UICollectionViewDelegate {
    
    // MARK: selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.item)번 Cell 클릭")
    }
}

extension TestViewController: UICollectionViewDelegateFlowLayout {
    
    // MARK: cellSize
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let cellItemForRow: CGFloat = 3
        let minimumSpacing: CGFloat = 2
        
        let width = (collectionViewWidth - (cellItemForRow - 1) * minimumSpacing) / cellItemForRow
        
        return CGSize(width: width, height: width)
    }
    
    // MARK: minimumSpacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}
