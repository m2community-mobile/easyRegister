////
////  SearchNavigationViewController.swift
////  UnsplashCloneCode
////
////  Created by skillist on 2021/11/28.
////
//
//import UIKit
//import Alamofire
//import SnapKit
//
//class MyViewController: UINavigationController {
//
//    let logoutButton = UIButton()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
////        navigationController?.isNavigationBarHidden = true
//        
//        let searchBar = UISearchBar()
//                
//                
//                  
//                        searchBar.placeholder = "Search User"
//                
//                
//                  
//                        self.navigationItem.titleView = searchBar
//        
//        
//        makeViews()
//        setViews()
//       
//    }
//    
//    
//    private func makeViews(){
//        
//        
//        self.logoutButton.layer.cornerRadius = 25
//        self.logoutButton.backgroundColor = .white
//        self.logoutButton.setImage(UIImage(systemName: "applelogo"), for: .normal)
//        self.logoutButton.setTitle("  Logout with Apple", for: .normal)
//        self.logoutButton.setTitleColor(.label, for: .normal)
//        self.logoutButton.titleLabel?.font = .systemFont(ofSize: 17.0)
//        self.logoutButton.imageView?.tintColor = .black
//        self.logoutButton.layer.borderWidth = 0.5
//        self.logoutButton.addTarget(self, action: #selector(tappedAppleLogoutBtn), for: .touchUpInside)
//////
//        
//    }
//    
//    private func setViews(){
//        
//        // apple info
//        [logoutButton].forEach({view.addSubview($0)})
//       
//        self.logoutButton.snp.makeConstraints({
//            $0.leading.trailing.equalToSuperview().inset(50)
//            $0.top.equalTo(navigationBar.snp.bottom).offset(60)
//            $0.height.equalTo(50)
//        })
//        ///
//        
//    }
//    
//    func revokeAppleToken(clientSecret: String, token: String, completionHandler: @escaping () -> Void) {
//        let url = "https://appleid.apple.com/auth/revoke?client_id=YOUR_BUNDLE_ID&client_secret=\(clientSecret)&token=\(token)&token_type_hint=refresh_token"
//        let header: HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded"]
//
//        AF.request(url,
//                   method: .post,
//                   headers: header)
//        .validate(statusCode: 200..<600)
//        .responseData { response in
//            guard let statusCode = response.response?.statusCode else { return }
//            if statusCode == 200 {
//                print("애플 토큰 삭제 성공!")
//                completionHandler()
//            }
//        }
//    }
//    
//    @objc func tappedAppleLogoutBtn() {
//        print("tab")
//        
//        // MARK: - 애플 토큰 삭제
//        if let clientSecret = UserDefaults.standard.string(forKey: "AppleClientSecret"),
//           let refreshToken = UserDefaults.standard.string(forKey: "AppleRefreshToken") {
//            print("Client_Secret - \(clientSecret)")
//            print("refresh_token - \(refreshToken)")
//            
//            // api 통신
//            self.revokeAppleToken(clientSecret: clientSecret, token: refreshToken) {
//                print("애플 탈퇴 성공!")
//                UserDefaults.standard.set(nil, forKey: "AppleClientSecret")
//                UserDefaults.standard.set(nil, forKey: "AppleRefreshToken")
//            }
//        }
//    }
//}

