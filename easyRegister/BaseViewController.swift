import UIKit
import FontAwesome_swift
//rgb 17 37 115
let mainColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

class BaseViewController: UIViewController {

    
    let labelOne: UILabel = {
      let label = UILabel()
      label.text = "Scroll Top"
      label.backgroundColor = .red
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    let labelTwo: UILabel = {
      let label = UILabel()
      label.text = ""
      label.backgroundColor = .red
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    let scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.backgroundColor = .white
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
    }()
    
    var footer: UIView!
    var testButton : UIButton!
    
    
    var naviBar : UIView!
    
    var img : UIImageView!
    
    var imgView : UIImage!
    
    var subTitleString = ""
    
    var subTitleView : UIView!
    
    var textString = ""
    var textIn : UILabel!
    
    var subTitleStrings = ""
    var subTitleIn : UILabel!
    
    
    
//    var subTitleLabel : UILabel!
    
//    var backButton : UIButton!

//    var backButtonimageView : UIImageView!
    
  
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.backgroundColor = .white
        self.view.backgroundColor = UIColor.white

        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
        statusBar.backgroundColor = mainColor
        
        self.view.addSubview(statusBar)
        
        naviBar = UIView(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
        naviBar.backgroundColor = .white
        self.view.addSubview(naviBar)
        
        
        self.view.addSubview(scrollView)

        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: naviBar.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

//          scrollView.addSubview(labelOne)
//
//          labelOne.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
//          labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true

        scrollView.addSubview(labelTwo)
        labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 2000).isActive = true
        labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
        
        
        
        

        img = UIImageView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height / 3))
//        img.backgroundColor = .yellow
//        img.image = img.image
        
        img.image = imgView
        
        scrollView.addSubview(img)
        
//        textIn = UILabel(frame: CGRect(x: img.frame.minX + 20, y: img.frame.maxY + 20, width: 100, height: 20))
//        textIn.text = textString
//        scrollView.addSubview(textIn)
//        
//        subTitleIn = UILabel(frame: CGRect(x: img.frame.minX + 20, y: textIn.frame.maxY + 20, width: 300, height: 20))
//        subTitleIn.text = subTitleStrings
//        scrollView.addSubview(subTitleIn)
        
       
        
        
        
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH - (naviBar.frame.size.width), height: naviBar.frame.size.height))
        titleLabel.center.x = SCREEN.WIDTH / 2
        titleLabel.text = ""
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont(name: NotoSansCJKkr_Medium, size: 17.5)
        if IS_IPHONE_SE {
            titleLabel.font = UIFont(name: NotoSansCJKkr_Medium, size: 15)
        }
        titleLabel.textAlignment = .center
        naviBar.addSubview(titleLabel)
        
        let button = UIButton(type: .custom)
            //Set the image
            button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
            //Set the title
            button.setTitle("Home", for: .normal)
        button.setTitleColor(.black, for: .normal)
            //Add target
            button.addTarget(self, action: #selector(callMethod), for: .touchUpInside)
            button.frame = CGRect(x: 10, y: 10, width: 100, height: 50)
            button.sizeToFit()
        
        naviBar.addSubview(button)
        
        
        // only native view backbtn( pag View, photo view ...)
        //rgb 22 18 63
//        subTitleView = UIView(frame: CGRect(x: 0, y: naviBar.frame.maxY, width: SCREEN.WIDTH, height: 40))
//        subTitleView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        self.view.addSubview(subTitleView)
        
        footer = UIView(frame: CGRect(x: 0, y: self.view.frame.maxY - 100, width: self.view.frame.width, height: 100))
        footer.backgroundColor = .white
        self.view.addSubview(footer)
        
        testButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: footer.frame.height))
        

        
        
        
        testButton.setTitle("신청하기", for: .normal)
        testButton.setTitleColor(.white, for: .normal)
//        testButton.addTarget(self, action: #selector(test), for: .touchUpInside)
        footer.addSubview(testButton)
        
        
        
        
//        backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
//        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
//        naviBar.addSubview(backButton)
//        backButton.tintColor = .black
//
//        backButtonimageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
////        backButtonimageView.setImageWithFrameWidth(image: UIImage(named: "back")?.withRenderingMode(.alwaysTemplate))
//        backButtonimageView.image = UIImage(named: "back")
//        backButtonimageView.center.x = backButton.frame.size.width / 2
//        backButtonimageView.isUserInteractionEnabled = false
//        backButtonimageView.center = CGPoint(x: backButton.frame.size.width / 2, y: backButton.frame.size.height / 2)
//        backButtonimageView.tintColor = UIColor.white
//        backButton.addSubview(backButtonimageView)
        
//        subTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH - (backButton.frame.size.width * 2), height: subTitleView.frame.size.height))
//        subTitleLabel.center.x = SCREEN.WIDTH / 2
//        subTitleLabel.text = subTitleString
//        subTitleLabel.textColor = UIColor.white
//        subTitleLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 15)
//        subTitleLabel.textAlignment = .center
//        subTitleView.addSubview(subTitleLabel)
//
//        let underBar = UIView(frame: CGRect(x: 0, y: subTitleView.frame.maxY, width: SCREEN.WIDTH, height: 0.5))
//        underBar.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1).withAlphaComponent(0.5)
//        self.view.addSubview(underBar)
        
        
    }
    
    
    
    @objc func callMethod(){
        self.dismiss(animated: false)
    }
    
//    @objc func test() {
//        print("tab")
//
//    }
    
}
