//
//  CategoryItem.swift
//  easyRegister
//
//  Created by m2comm on 2023/12/18.
//

import Foundation
struct ExampleJson2KtSwift: Codable {

  var data : Data? = Data()

  enum CodingKeys: String, CodingKey {

    case data = "data"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    data = try values.decodeIfPresent(Data.self , forKey: .data )
 
  }

  init() {

  }

}

struct cateItem: Codable {

  var id            : String? = nil
  var eventDate     : String? = nil
  var likeYn        : String? = nil
  var imgSrc        : String? = nil
  var title         : String? = nil
  var subTitle      : String? = nil
  var discount      : String? = nil
  var discountCode  : String? = nil
  var originalPrice : String? = nil
  var discountPrice : String? = nil

  enum CodingKeys: String, CodingKey {

    case id            = "id"
    case eventDate     = "event_date"
    case likeYn        = "like_yn"
    case imgSrc        = "img_src"
    case title         = "title"
    case subTitle      = "sub_title"
    case discount      = "discount"
    case discountCode  = "discount_code"
    case originalPrice = "original_price"
    case discountPrice = "discount_price"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id            = try values.decodeIfPresent(String.self , forKey: .id            )
    eventDate     = try values.decodeIfPresent(String.self , forKey: .eventDate     )
    likeYn        = try values.decodeIfPresent(String.self , forKey: .likeYn        )
    imgSrc        = try values.decodeIfPresent(String.self , forKey: .imgSrc        )
    title         = try values.decodeIfPresent(String.self , forKey: .title         )
    subTitle      = try values.decodeIfPresent(String.self , forKey: .subTitle      )
    discount      = try values.decodeIfPresent(String.self , forKey: .discount      )
    discountCode  = try values.decodeIfPresent(String.self , forKey: .discountCode  )
    originalPrice = try values.decodeIfPresent(String.self , forKey: .originalPrice )
    discountPrice = try values.decodeIfPresent(String.self , forKey: .discountPrice )
 
  }

  init() {

  }

}

struct Data: Codable {

  var categoryId   : String? = nil
  var categoryText : String? = nil
  var item         : [Item]? = []

  enum CodingKeys: String, CodingKey {

    case categoryId   = "category_id"
    case categoryText = "category_text"
    case item         = "item"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    categoryId   = try values.decodeIfPresent(String.self , forKey: .categoryId   )
    categoryText = try values.decodeIfPresent(String.self , forKey: .categoryText )
    item         = try values.decodeIfPresent([Item].self , forKey: .item         )
 
  }

  init() {

  }

}
