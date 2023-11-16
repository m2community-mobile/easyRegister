//
//  SignValidViewController.swift
//  LoginApp
//
//  Created by m2comm on 2023/10/19.
//

import Foundation
import UIKit
import SwiftJWT
import Alamofire


class SignValidViewController: UIViewController {
    
    var labelOne: UILabel = {
      let label = UILabel()
      label.text = "hellow IOS WORLD"
      label.backgroundColor = .red
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    let logoutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        self.view.addSubview(labelOne)
        
                  labelOne.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40).isActive = true
                  labelOne.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        
        
        self.logoutButton.layer.cornerRadius = 25
        self.logoutButton.backgroundColor = .white
        self.logoutButton.setImage(UIImage(systemName: "applelogo"), for: .normal)
        self.logoutButton.setTitle("  logout", for: .normal)
        self.logoutButton.setTitleColor(.label, for: .normal)
        self.logoutButton.titleLabel?.font = .systemFont(ofSize: 17.0)
        self.logoutButton.imageView?.tintColor = .black
        self.logoutButton.layer.borderWidth = 0.5
        self.logoutButton.addTarget(self, action: #selector(tappedAppleLogoutBtn), for: .touchUpInside)
        setViews()

        
        let jwtString = self.makeJWT()

               guard let taCode = UserDefaults.standard.string(forKey: "theAuthorizationCode") else { return }

               self.getAppleRefreshToken(code: taCode, completionHandler: { output in

                   //                        if let clientSecret = UserDefaults.standard.string(forKey: "AppleClientSecret"),
                   //                           let refreshToken = UserDefaults.standard.string(forKey: "AppleRefreshToken") {
                   let clientSecret = jwtString
                   if let refreshToken = output{
                       print("Client_Secret - \(clientSecret)")
                       print("refresh_token - \(refreshToken)")

                       // api 통신
                       self.revokeAppleToken(clientSecret: clientSecret, token: refreshToken) {
                           print("Apple revoke token Success")

                       }
                   }else{
                       let dialog = UIAlertController(title: "error", message: "회원탈퇴 실패", preferredStyle: .alert)
                       let okayAction = UIAlertAction(title: "확인", style: .default, handler: {_ in
                           self.dismiss(animated: false)
                       })
                       dialog.addAction(okayAction)
                       self.present(dialog, animated: false, completion: nil)
                   }
               })
    }
    
    private func setViews(){
        [logoutButton].forEach({view.addSubview($0)})
       
     
        
        self.logoutButton.snp.makeConstraints({
            $0.leading.trailing.equalToSuperview().inset(50)
            $0.top.equalTo(self.labelOne.snp.bottom).offset(60)
            $0.height.equalTo(50)
        })
    }
    
}


extension SignValidViewController{
    // MARK: - 애플 엑세스 토큰 발급 응답 모델
    struct AppleTokenResponse: Codable {
        var access_token: String?
        var token_type: String?
        var expires_in: Int?
        var refresh_token: String?
        var id_token: String?

        enum CodingKeys: String, CodingKey {
            case refresh_token = "refresh_token"
        }
    }


    //client_secret
    func makeJWT() -> String{
        let myHeader = Header(kid: "X598C84398") //sign in with apple key ID
        
        // MARK: - client_secret(JWT) 발급 응답 모델
        struct MyClaims: Claims {
            let iss: String
            let iat: Int
            let exp: Int
            let aud: String
            let sub: String
        }

        let nowDate = Date()
        var dateComponent = DateComponents()
        dateComponent.month = 6
        let sixDate = Calendar.current.date(byAdding: dateComponent, to: nowDate) ?? Date()
        let iat = Int(Date().timeIntervalSince1970)
        let exp = iat + 3600
        let myClaims = MyClaims(iss: "8GTG7652DS",
                                iat: iat,
                                exp: exp,
                                aud: "https://appleid.apple.com",
                                sub: "kr.co.TestRes")

        var myJWT = JWT(header: myHeader, claims: myClaims)

        guard let url = Bundle.main.url(forResource: "AuthKey_2AHWAT4GCU", withExtension: "p8") else{
            return ""
        }
        let privateKey: Data = try! Data(contentsOf: url, options: .alwaysMapped)

        let jwtSigner = JWTSigner.es256(privateKey: privateKey)
        let signedJWT = try! myJWT.sign(using: jwtSigner)
        UserDefaults.standard.set(signedJWT, forKey: "AppleClientSecret")
        print("🗝 singedJWT - \(signedJWT)")
        return signedJWT
    }



    //client_refreshToken
    func getAppleRefreshToken(code: String, completionHandler: @escaping (String?) -> Void) {

        guard let secret = UserDefaults.standard.string(forKey: "AppleClientSecret") else {return}

        let url = "https://appleid.apple.com/auth/token?client_id=kr.co.TestRes&client_secret=\(secret)&code=\(code)&grant_type=authorization_code"
        print("--------->\(url)")
        let header: HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded"]

        print("🗝 clientSecret - \(UserDefaults.standard.string(forKey: "AppleClientSecret"))")
        print("🗝 authCode - \(code)")

        let a = AF.request(url, method: .post, encoding: JSONEncoding.default, headers: header)
        .validate(statusCode: 200..<500)
        .responseData { response in
            print("🗝 response - \(response.description)")

            switch response.result {
            case .success(let output):
//                print("🗝 ouput - \(output)")
                let decoder = JSONDecoder()
                if let decodedData = try? decoder.decode(AppleTokenResponse.self, from: output){
//                    print("🗝 ouput2 - \(decodedData.refresh_token)")

                    if decodedData.refresh_token == nil{
                        let dialog = UIAlertController(title: "error", message: "회원탈퇴 실패", preferredStyle: .alert)
                        let okayAction = UIAlertAction(title: "확인", style: .default, handler: {_ in
                            self.dismiss(animated: true)
                        })
                        dialog.addAction(okayAction)
                        self.present(dialog, animated: false, completion: nil)
                    }else{
                        completionHandler(decodedData.refresh_token)
                    }
                }

            case .failure(_):
                //로그아웃 후 재로그인하여
                print("애플 토큰 발급 실패 - \(response.error.debugDescription)")
                let dialog = UIAlertController(title: "error", message: "회원탈퇴 실패", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "확인", style: .default, handler: {_ in
                    self.dismiss(animated: false)
                })
                dialog.addAction(okayAction)
                self.present(dialog, animated: false, completion: nil)
            }
        }
    }





    func revokeAppleToken(clientSecret: String, token: String, completionHandler: @escaping () -> Void) {
        print("안타?")
        let url = "https://appleid.apple.com/auth/revoke?client_id=kr.co.TestRes&client_secret=\(clientSecret)&token=\(token)&token_type_hint=refresh_token"
        let header: HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded"]

        AF.request(url,
                   method: .post,
                   headers: header)
        .validate(statusCode: 200..<600)
        .responseData { response in
            guard let statusCode = response.response?.statusCode else { return }
            if statusCode == 200 {
                print("애플 토큰 삭제 성공!")
                completionHandler()
            }
        }
    }
    
    @objc func tappedAppleLogoutBtn() {
        print("tab")
        
        // MARK: - 애플 토큰 삭제
        if let clientSecret = UserDefaults.standard.string(forKey: "AppleClientSecret"),
           let refreshToken = UserDefaults.standard.string(forKey: "AppleRefreshToken") {
            print("Client_Secret - \(clientSecret)")
            print("refresh_token - \(refreshToken)")
            print("여기?")
            
            // api 통신
            self.revokeAppleToken(clientSecret: clientSecret, token: refreshToken) {
                print("애플 탈퇴 성공!")
                UserDefaults.standard.set(nil, forKey: "AppleClientSecret")
                UserDefaults.standard.set(nil, forKey: "AppleRefreshToken")
                print("여기!")
            }
        }
        
        
//        let jwtString = self.makeJWT()
//
//               guard let taCode = UserDefaults.standard.string(forKey: "theAuthorizationCode") else { return }
//
//               self.getAppleRefreshToken(code: taCode, completionHandler: { output in
//
//                   //                        if let clientSecret = UserDefaults.standard.string(forKey: "AppleClientSecret"),
//                   //                           let refreshToken = UserDefaults.standard.string(forKey: "AppleRefreshToken") {
//                   let clientSecret = jwtString
//                   if let refreshToken = output{
//                       print("Client_Secret - \(clientSecret)")
//                       print("refresh_token - \(refreshToken)")
//
//                       // api 통신
//                       self.revokeAppleToken(clientSecret: clientSecret, token: refreshToken) {
//                           print("Apple revoke token Success")
//
//                       }
//                   }else{
//                       let dialog = UIAlertController(title: "error", message: "회원탈퇴 실패", preferredStyle: .alert)
//                       let okayAction = UIAlertAction(title: "확인", style: .default, handler: {_ in
//                           self.dismiss(animated: true)
//                       })
//                       dialog.addAction(okayAction)
//                       self.present(dialog, animated: true, completion: nil)
//                   }
//               })
    }
}
