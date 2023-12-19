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
    
    
    private var task: URLSessionDataTask?
    
    
    
    
    
    
    
    @IBAction func heartClick(_ sender: UIButton) {
//        guard let idx = index else {return}
//        var sections = MockData.shared.pageData
//
//
//
//
//
//        sender.isSelected = !sender.isSelected
//
//                if sender.isSelected {
//
//
//
//                    print("first?")
//
//
//                    isTouched = true
//                    delegate?.didPressHeart(for: idx, like: true)
//
//
//
//
//
//                }else {
//                    isTouched = false
//                    delegate?.didPressHeart(for: idx, like: false)
//                }
                
    }
    
    var isTouched: Bool? {
            didSet {
                if isTouched == true {
                    heartButton.setImage(UIImage(systemName: "heart.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large)), for: .normal)
//                    heartButton.setTitleColor(.red, for: .normal)
                    heartButton.tintColor = .red
                    
                }else{
                    heartButton.setImage(UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(scale: .large)), for: .normal)
                    heartButton.tintColor = .lightGray
                }
            }
        }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        
        
        task?.cancel()
        task = nil
        
        setupUI(by: "")
        cellImageView.image = nil
        
        cellprinceLbl.text = nil
        cellTitleLbl.text = nil
        
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        heartButton.tintColor = .lightGray


        
        
    }
    
    func setupUI(by url: String) {
        if task == nil {
            task = cellImageView.loadImage(from: url)
        }
    }

    
    @IBOutlet weak var cellprinceLbl: UILabel!
    func setup(_ item: DataClass) {
//        cellImageView.image = UIImage(named: item.item[indexPath.row].imgSrc)
        print("????\(item)")
//        for i in item.menuList.menu {
//            print("?sdlkjsajdlskfdsjkls\(i)")
//        }
        
        
//        cellTitleLbl.text = item.menuList.menu[indexPath.row].id
    }
    
    
}
