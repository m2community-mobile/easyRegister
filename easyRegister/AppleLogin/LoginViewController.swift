//
//  ViewController.swift
//  LoginApp
//
//  Created by m2comm on 2023/10/19.
//

import UIKit
import SnapKit
import AuthenticationServices
import KeychainSwift



struct UserData {
    let profile:UIImage
    let name:String
    let email:String
}


class LoginViewController: UIViewController {
    // apple login
  let logoImageView = UIImageView()
  let welcomeLabel = UILabel()
  let loginButton = UIButton()


    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        
        self.setViews()
        self.makeViews()
        

        
    }
    /// apple info
    private func makeViews(){
        self.logoImageView.image = UIImage(systemName: "applelogo")
        self.logoImageView.tintColor = .systemGray
        self.logoImageView.contentMode = .scaleAspectFit
        
        self.welcomeLabel.numberOfLines = 0
        self.welcomeLabel.textAlignment = .center
        self.welcomeLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        self.welcomeLabel.text = "Welcome! Sign With Apple to enjoy our Service"
        self.welcomeLabel.textColor = .label
        
        self.loginButton.layer.cornerRadius = 25
        self.loginButton.backgroundColor = .white
        self.loginButton.setImage(UIImage(systemName: "applelogo"), for: .normal)
        self.loginButton.setTitle("  Sign in with Apple", for: .normal)
        self.loginButton.setTitleColor(.label, for: .normal)
        self.loginButton.titleLabel?.font = .systemFont(ofSize: 17.0)
        self.loginButton.imageView?.tintColor = .black
        self.loginButton.layer.borderWidth = 0.5
        self.loginButton.addTarget(self, action: #selector(tappedAppleLoginBtn), for: .touchUpInside)
////
        
    }
    
    private func setViews(){
        
        // apple info
        [logoImageView, welcomeLabel, loginButton].forEach({view.addSubview($0)})
       
        self.logoImageView.snp.makeConstraints({
            $0.width.equalTo(50)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().multipliedBy(0.80)
        })
        
        self.welcomeLabel.snp.makeConstraints({
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalTo(self.logoImageView.snp.bottom).offset(20)
        })
        
        self.loginButton.snp.makeConstraints({
            $0.leading.trailing.equalToSuperview().inset(50)
            $0.top.equalTo(self.welcomeLabel.snp.bottom).offset(60)
            $0.height.equalTo(50)
        })
        ///
        
    }
    
    @objc func tappedAppleLoginBtn() {
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email] //유저로 부터 알 수 있는 정보들(name, email)
               
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}

extension LoginViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding{
  func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    //로그인 성공
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            // You can create an account in your system.
            let userIdentifier = appleIDCredential.user
            
            
            
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            
            if  let authorizationCode = appleIDCredential.authorizationCode,
                let identityToken = appleIDCredential.identityToken,
                let authCodeString = String(data: authorizationCode, encoding: .utf8),
                let identifyTokenString = String(data: identityToken, encoding: .utf8) {
                print("authorizationCode: \(authorizationCode)")
                print("identityToken: \(identityToken)")
                print("authCodeString: \(authCodeString)")
                print("identifyTokenString: \(identifyTokenString)")
            }
            
            print("useridentifier: \(userIdentifier)")
            print("fullName: \(fullName)")
            print("email: \(email)")
            
            
            //Move to MainPage
            let validVC = TabBarController()
            validVC.modalPresentationStyle = .fullScreen
            present(validVC, animated: true, completion: nil)
            
        case let passwordCredential as ASPasswordCredential:
            // Sign in using an existing iCloud Keychain credential.
            let username = passwordCredential.user
            let password = passwordCredential.password
            
            print("username: \(username)")
            print("password: \(password)")
            
        default:
            break
        }
    }
    

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // 로그인 실패(유저의 취소도 포함)
        print("login failed - \(error.localizedDescription)")
    }
    
    
}






