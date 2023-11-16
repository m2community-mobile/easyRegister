//
//  Server.swift
//  easyRegister
//
//  Created by m2comm on 2023/10/26.
//

import Foundation
import UIKit
import Alamofire

func getTest() {
        let url = "https://ezv.kr:4447/shin/json/result_menu.json"
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: ["Content-Type":"application/json", "Accept":"application/json"])
            .validate(statusCode: 200..<300)
            .responseJSON { (json) in
                //여기서 가져온 데이터를 자유롭게 활용하세요.
                print(json)
                
                
                
                
        }
    }
