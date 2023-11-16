import UIKit




class CategoryViewController: UIViewController {

    
    
    
////스크롤뷰 컨텐트
    let labelOne: UILabel = {
      let label = UILabel()
      label.text = "Scroll Top"
      label.backgroundColor = .red
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    let labelTwo: UILabel = {
      let label = UILabel()
      label.text = "Scroll Bottom"
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
    //////
    ///
    
    var dataList: [Banner] = []
    
    var heartButton : UIButton!
    var isChecked = true
    
    
    var cellId = "cellId"
    
//    var cardTexts = ["Woongs", "iOS", "Success", "3S", ":D"]
    
    var img = [UIImage(named: "dog"), UIImage(named: "cat"), UIImage(named: "dog")]
    var test = [UIImage(named: "cat"), UIImage(named: "dog"), UIImage(named: "cat"), UIImage(named: "cat")]
    var testLabel = ["고양이", "강아지", "고양이", "고양이"]
    var infoLabel = ["이건 고양이", "이건 강아지", "얘도 고양이", "고양이 좋아"]
    
    let carouselCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 20
        
        
        
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        var collectionView = UICollectionView(frame: .init(x: 0, y: 0, width: 1000, height: 50), collectionViewLayout: flowLayout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
//        collectionView.isPagingEnabled = true
        collectionView.decelerationRate = .fast
        collectionView.isPagingEnabled = false
        
        
      
        return collectionView
    }()
    
    
    let testCollecttionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .horizontal
//        flowLayout.minimumLineSpacing = 50
//        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 375, height: 250)
        flowLayout.minimumLineSpacing = 10
        
        var collectionView = UICollectionView(frame: .init(x: 0, y: 250, width: 100, height: 50), collectionViewLayout: flowLayout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        
        return collectionView
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
        
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
        statusBar.backgroundColor = .white
        self.view.addSubview(statusBar)
        
        let naviBar = UIView(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
        if IS_IPHONE_SE { naviBar.frame.size.height = NAVIGATION_BAR_HEIGHT }
        self.view.addSubview(naviBar)
        
        naviBar.layer.addBorder([.bottom], color: .black, width: 1)
        
        
        //// 전체 스크롤뷰
          self.view.addSubview(scrollView)

          scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: statusBar.frame.size.height + naviBar.frame.size.height).isActive = true
          scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

//          scrollView.addSubview(labelOne)
//
//          labelOne.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
//          labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true

          scrollView.addSubview(labelTwo)

          labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
          labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1500).isActive = true
          labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
        /////
        ///
        ///
        setupGradient(view)
        setupCarouselCollectionView()
      setUpTest()
       
        
        guard let layout = self.carouselCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
            
            // CollectionView Item Size
            let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
            
            // 이동한 x좌표 값과 item의 크기를 비교 후 페이징 값 설정
            let estimatedIndex = scrollView.contentOffset.x / cellWidthIncludingSpacing
            let index: Int
            
            // 스크롤 방향 체크
            // item 절반 사이즈 만큼 스크롤로 판단하여 올림, 내림 처리
        if carouselCollectionView.frame.origin.x > 0 {
                index = Int(ceil(estimatedIndex))
        } else if carouselCollectionView.frame.origin.x < 0 {
                index = Int(floor(estimatedIndex))
            } else {
                index = Int(round(estimatedIndex))
            }
            // 위 코드를 통해 페이징 될 좌표 값을 targetContentOffset에 대입
        carouselCollectionView.contentOffset = CGPoint(x: CGFloat(index) * cellWidthIncludingSpacing, y: 0)
      
        
    }
    
    
    func getData() {
        let url = URL(string: "https://ezv.kr:4447/shin/json/result_menu.json")
        
        //Request 객체
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        //URLSessionConfiguration - shared(singleton)
        //URLSessionTask - DataTask
        //Completion Handler를 통한 Response 처리
        let dataTask = URLSession.shared.dataTask(with: request, completionHandler: {[weak self] data, response, error in
            guard error == nil,
                  let response = response as? HTTPURLResponse,
                  let data = data,
                  //응답으로 받은 JSON Decoding
                  let jsonData = try? JSONDecoder().decode(JsonData.self, from: data) else{
                print("ERROR : URLSesstion data task \(error?.localizedDescription ?? "")")
                return
            }
            
            //상태 확인
            switch response.statusCode {
            case (200...299): //성공
                print("\(jsonData)")
                DispatchQueue.main.async {
                    
                    print("\(jsonData.data.famousCategory.category[0].title)")
                    
                    
                    
                    
                    
                }
        
                
            case (400...499): //client error
                print("""
                     ERROR: Client Error - \(response.statusCode)
                     Response: \(response)
                  """)
                
            case(500...599): //server error
                print("""
                     ERROR: Server Error - \(response.statusCode)
                     Response: \(response)
                  """)
                
            default:
                print("""
                     ERROR: \(response.statusCode)
                     Response: \(response)
                  """)
            }
        })
        
        //선언 후 꼭 resume(실행)을 해주어야 함
        dataTask.resume()
    }
    
    /// 가로 스크롤 뷰
    func setupShadow(_ view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 5
//        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
    }
    
    func setupGradient(_ view: UIView) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [
//            UIColor(hexString: "#ff9a9e").cgColor,
//            UIColor(hexString: "#fad0c4").cgColor,
        ]
        
        view.layer.addSublayer(gradient)
//        view.addSubview(carouselCollectionView)
        scrollView.addSubview(carouselCollectionView)
        view.backgroundColor = UIColor.white
        
        scrollView.addSubview(testCollecttionView)
        testCollecttionView.backgroundColor = .white
        
        
    }

    func setupCarouselCollectionView() {
        carouselCollectionView.register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        carouselCollectionView.dataSource = self
        carouselCollectionView.delegate = self
        
 
        NSLayoutConstraint.activate([
            
//            carouselCollectionView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
//            carouselCollectionView.heightAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1.2/1.0, constant: -40),
            carouselCollectionView.heightAnchor.constraint(equalToConstant: 150),
            
            
            carouselCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            carouselCollectionView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            carouselCollectionView.rightAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.rightAnchor, constant: 0)
            
            ])
        
    }
    //////
    func setUpTest() {
        testCollecttionView.register(mainTitleCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        testCollecttionView.dataSource = self
        testCollecttionView.delegate = self
        
        NSLayoutConstraint.activate([
            testCollecttionView.heightAnchor.constraint(equalToConstant: 150),
            
            testCollecttionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            testCollecttionView.topAnchor.constraint(equalTo: carouselCollectionView.bottomAnchor, constant: 10),
            testCollecttionView.rightAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.rightAnchor, constant: 10)
            
            
            
            ])
        
    }
    
    @objc func tab(sender: UIButton!) {
        
        isChecked = !isChecked
        if isChecked {

            
            
            heartButton.tintColor = .red
            
            
        } else {

            
            
            heartButton.tintColor = .lightGray
            
            
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            
        }
            
            
    }
    
    
    
    
}

extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}


extension CategoryViewController: UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == carouselCollectionView {
            return dataList.count
            
        } else if collectionView == testCollecttionView {
            
            return test.count
        }
        
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let defaultCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
//        guard let cell: CarouselCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CarouselCollectionViewCell else {
//            return defaultCell
//        }
//
//        setupShadow(cell)
////        cell.cellTextLabel.text = cardTexts[indexPath.item]
//        cell.img.image = img[indexPath.item]
//        return cell
        
        
        if collectionView == carouselCollectionView {
            let defaultCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
            guard let cell: CarouselCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CarouselCollectionViewCell else {
                return defaultCell
            }
            
            setupShadow(cell)
    //        cell.cellTextLabel.text = cardTexts[indexPath.item]
            cell.img.image = img[indexPath.item]
            return cell
        } else if collectionView == testCollecttionView {
            let defaultCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
            guard let cell: mainTitleCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? mainTitleCollectionViewCell else {
                return defaultCell
            }
            
            setupShadow(cell)
    //        cell.cellTextLabel.text = cardTexts[indexPath.item]
            cell.img.image = test[indexPath.item]
            
            cell.cellTextLabel.text = testLabel[indexPath.item]
            cell.cellInfoLabel.text = infoLabel[indexPath.item]
            
            cell.cellTextLabel.topAnchor.constraint(equalTo: cell.img.bottomAnchor, constant: 10).isActive = true
            cell.cellInfoLabel.topAnchor.constraint(equalTo: cell.cellTextLabel.bottomAnchor, constant: 10).isActive = true
            
            cell.cellHeartButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            cell.cellHeartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            
            
        
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension CategoryViewController: UICollectionViewDelegate {
    
}
// collectionView 사이즈 조절
extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == carouselCollectionView {
            return CGSize(width: view.frame.width-80, height: carouselCollectionView.frame.height)
        } else if collectionView == testCollecttionView {
            return CGSize(width: 150, height: 200)
        }
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.item)")
        
       
     
        
        
        if collectionView == carouselCollectionView {
            
            let vc = DetailedViewController()
            
            vc.imgView = img[indexPath.row]
            
    //        sceneDel.naviCon?.popToRootViewController(animated: popAnimation)
    //        sceneDel.naviCon?.pushViewController(nextVC, animated: pushAnimation)
            
            vc.modalPresentationStyle = .fullScreen
            
    //        sceneDel?.window?.rootViewController?.present(vc, animated: true)
            self.present(vc, animated: false)
            
        } else if collectionView == testCollecttionView {
            
            
            let vc = DetailedViewController()
            
            vc.imgView = test[indexPath.row]
            
            vc.textString = testLabel[indexPath.row]
            
    //        sceneDel.naviCon?.popToRootViewController(animated: popAnimation)
    //        sceneDel.naviCon?.pushViewController(nextVC, animated: pushAnimation)
            
            vc.modalPresentationStyle = .fullScreen
            
    //        sceneDel?.window?.rootViewController?.present(vc, animated: true)
            self.present(vc, animated: false)
            
            
        }
        
        
    }
}


