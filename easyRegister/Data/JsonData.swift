////
////  Data.swift
////  accordingJsonCollecionView
////
////  Created by m2comm on 2023/10/26.
////
//
//import Foundation
//
//// MARK: - Welcome
//struct JsonData: Codable {
//    let data: DataClass
//}
//
//// MARK: - DataClass
//struct DataClass: Codable {
//    let famousCategory: FamousCategory
//    let topBanner: TopBanner
//    let menuList: MenuList
//
//    enum CodingKeys: String, CodingKey {
//        case famousCategory = "famous_category"
//        case topBanner = "top_banner"
//        case menuList = "menu_list"
//    }
//}
//
//// MARK: - FamousCategory
//struct FamousCategory: Codable {
//    let category: [Category]
//}
//
//// MARK: - Category
//struct Category: Codable {
//    let id, title: String
//}
//
//// MARK: - MenuList
//struct MenuList: Codable {
//    let menu: [Menu]
//}
//
//// MARK: - Menu
//struct Menu: Codable {
//    let id, title, subTitle, index: String
//    let type, cnt: String
//    let item: [Item]
//
//    enum CodingKeys: String, CodingKey {
//        case id, title
//        case subTitle = "sub_title"
//        case index, type, cnt, item
//    }
//}
//
//// MARK: - Item
//struct Item: Codable {
//    let id: String
//    let likeYn: Discount
//    let imgSrc: String
//    let title: String
//    let subTitle: String
//    let discount: Discount
//    let discountCode: DiscountCode
//    let originalPrice, discountPrice: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case likeYn = "like_yn"
//        case imgSrc = "img_src"
//        case title
//        case subTitle = "sub_title"
//        case discount
//        case discountCode = "discount_code"
//        case originalPrice = "original_price"
//        case discountPrice = "discount_price"
//    }
//}
//
//enum Discount: String, Codable {
//    case n = "N"
//    case y = "Y"
//}
//
//enum DiscountCode: String, Codable {
//    case a123 = "A123"
//    case empty = ""
//}
//
//enum SubTitle: String, Codable {
//    case empty = ""
//    case 작은설명123123 = "작은설명123123"
//    case 작은설명156156 = "작은설명156156"
//    case 작은설명456456 = "작은설명456456"
//    case 작은설명789789 = "작은설명789789"
//}
//
//// MARK: - TopBanner
//struct TopBanner: Codable {
//    let cnt: Int
//    let banner: [Banner]
//}
//
//// MARK: - Banner
//struct Banner: Codable {
//    let id: String
//    let imgSrc: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case imgSrc = "img_src"
//    }
//}


import Foundation

// MARK: - JSONData
struct JsonData: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let famousCategory: FamousCategory
    let topBanner: TopBanner
    let menuList: MenuList

    enum CodingKeys: String, CodingKey {
        case famousCategory = "famous_category"
        case topBanner = "top_banner"
        case menuList = "menu_list"
    }
}

// MARK: - FamousCategory
struct FamousCategory: Codable {
    let category: [Category]
}

// MARK: - Category
struct Category: Codable {
    let id, title: String
}

// MARK: - MenuList
struct MenuList: Codable {
    let menu: [Menu]
}

// MARK: - Menu
struct Menu: Codable {
    let id, title, subTitle, index: String
    let type, cnt: String
    var item: [Item]

    enum CodingKeys: String, CodingKey {
        case id, title
        case subTitle = "sub_title"
        case index, type, cnt, item
    }
}

// MARK: - Item
struct Item: Codable {
    let id: String
    let eventDate: String
    var likeYn: String
    let imgSrc: String
    let title: String
    let itemSubTitle: String?
    let discount: String
    let discountCode: String
    let originalPrice, discountRate, discountPrice: String
    let subTitle: String?

    enum CodingKeys: String, CodingKey {
        case id
        case eventDate = "event_date"
        case likeYn = "like_yn"
        case imgSrc = "img_src"
        case title
        case itemSubTitle = "sub_title"
        case discount
        case discountCode = "discount_code"
        case originalPrice = "original_price"
        case discountRate = "discount_rate"
        case discountPrice = "discount_price"
        case subTitle = ",sub_title"
    }
}








// MARK: - TopBanner
struct TopBanner: Codable {
    let cnt: Int
    let banner: [Banner]
}

// MARK: - Banner
struct Banner: Codable {
    let id: String
    let imgSrc: String

    enum CodingKeys: String, CodingKey {
        case id
        case imgSrc = "img_src"
    }
}





import Foundation


struct CategoryList: Codable {
    let data: CategoryData
}

// MARK: - DataClass
struct CategoryData: Codable {
    let category: [CategoryEtc]
}

// MARK: - Category
struct CategoryEtc: Codable {
    let id, title: String
}

///////////



//import Foundation
//
//struct JsonData: Codable {
//
//  var data : Data? = Data()
//
//  enum CodingKeys: String, CodingKey {
//
//    case data = "data"
//
//  }
//
//  init(from decoder: Decoder) throws {
//    let values = try decoder.container(keyedBy: CodingKeys.self)
//
//    data = try values.decodeIfPresent(Data.self , forKey: .data )
//
//  }
//
//  init() {
//
//  }
//
//}
//
//struct Data: Codable {
//
//  var famousCategory : FamousCategory? = FamousCategory()
//  var topBanner      : TopBanner?      = TopBanner()
//  var menuList       : MenuList?       = MenuList()
//
//  enum CodingKeys: String, CodingKey {
//
//    case famousCategory = "famous_category"
//    case topBanner      = "top_banner"
//    case menuList       = "menu_list"
//
//  }
//
//  init(from decoder: Decoder) throws {
//    let values = try decoder.container(keyedBy: CodingKeys.self)
//
//    famousCategory = try values.decodeIfPresent(FamousCategory.self , forKey: .famousCategory )
//    topBanner      = try values.decodeIfPresent(TopBanner.self      , forKey: .topBanner      )
//    menuList       = try values.decodeIfPresent(MenuList.self       , forKey: .menuList       )
//
//  }
//
//  init() {
//
//  }
//
//}
//
//struct FamousCategory: Codable {
//
//  var category : [Category]? = []
//
//  enum CodingKeys: String, CodingKey {
//
//    case category = "category"
//
//  }
//
//  init(from decoder: Decoder) throws {
//    let values = try decoder.container(keyedBy: CodingKeys.self)
//
//    category = try values.decodeIfPresent([Category].self , forKey: .category )
//
//  }
//
//  init() {
//
//  }
//
//}
//
//
//struct Category: Codable {
//
//  var id    : String? = nil
//  var title : String? = nil
//
//  enum CodingKeys: String, CodingKey {
//
//    case id    = "id"
//    case title = "title"
//
//  }
//
//  init(from decoder: Decoder) throws {
//    let values = try decoder.container(keyedBy: CodingKeys.self)
//
//    id    = try values.decodeIfPresent(String.self , forKey: .id    )
//    title = try values.decodeIfPresent(String.self , forKey: .title )
//
//  }
//
//  init() {
//
//  }
//
//}
//
//
//
//struct TopBanner: Codable {
//
//  var cnt    : Int?      = nil
//  var banner : [Banner]? = []
//
//  enum CodingKeys: String, CodingKey {
//
//    case cnt    = "cnt"
//    case banner = "banner"
//
//  }
//
//  init(from decoder: Decoder) throws {
//    let values = try decoder.container(keyedBy: CodingKeys.self)
//
//    cnt    = try values.decodeIfPresent(Int.self      , forKey: .cnt    )
//    banner = try values.decodeIfPresent([Banner].self , forKey: .banner )
//
//  }
//
//  init() {
//
//  }
//
//}
//
//struct Banner: Codable {
//
//  var id     : String? = nil
//  var imgSrc : String? = nil
//
//  enum CodingKeys: String, CodingKey {
//
//    case id     = "id"
//    case imgSrc = "img_src"
//
//  }
//
//  init(from decoder: Decoder) throws {
//    let values = try decoder.container(keyedBy: CodingKeys.self)
//
//    id     = try values.decodeIfPresent(String.self , forKey: .id     )
//    imgSrc = try values.decodeIfPresent(String.self , forKey: .imgSrc )
//
//  }
//
//  init() {
//
//  }
//
//}
//
//
//struct MenuList: Codable {
//
//  var menu : [Menu]? = []
//
//  enum CodingKeys: String, CodingKey {
//
//    case menu = "menu"
//
//  }
//
//  init(from decoder: Decoder) throws {
//    let values = try decoder.container(keyedBy: CodingKeys.self)
//
//    menu = try values.decodeIfPresent([Menu].self , forKey: .menu )
//
//  }
//
//  init() {
//
//  }
//
//}
//
//struct Menu: Codable {
//
//  var id       : String? = nil
//  var title    : String? = nil
//  var subTitle : String? = nil
//  var index    : String? = nil
//  var type     : String? = nil
//  var cnt      : String? = nil
//  var item     : [Item]? = []
//
//  enum CodingKeys: String, CodingKey {
//
//    case id       = "id"
//    case title    = "title"
//    case subTitle = "sub_title"
//    case index    = "index"
//    case type     = "type"
//    case cnt      = "cnt"
//    case item     = "item"
//
//  }
//
//  init(from decoder: Decoder) throws {
//    let values = try decoder.container(keyedBy: CodingKeys.self)
//
//    id       = try values.decodeIfPresent(String.self , forKey: .id       )
//    title    = try values.decodeIfPresent(String.self , forKey: .title    )
//    subTitle = try values.decodeIfPresent(String.self , forKey: .subTitle )
//    index    = try values.decodeIfPresent(String.self , forKey: .index    )
//    type     = try values.decodeIfPresent(String.self , forKey: .type     )
//    cnt      = try values.decodeIfPresent(String.self , forKey: .cnt      )
//    item     = try values.decodeIfPresent([Item].self , forKey: .item     )
//
//  }
//
//  init() {
//
//  }
//
//}
//
//
//struct Item: Codable {
//
//  var id            : String? = nil
//  var eventDate     : String? = nil
//  var likeYn        : String? = nil
//  var imgSrc        : String? = nil
//  var title         : String? = nil
//  var subTitle      : String? = nil
//  var discount      : String? = nil
//  var discountCode  : String? = nil
//  var originalPrice : String? = nil
//  var discountRate  : String? = nil
//  var discountPrice : String? = nil
//
//  enum CodingKeys: String, CodingKey {
//
//    case id            = "id"
//    case eventDate     = "event_date"
//    case likeYn        = "like_yn"
//    case imgSrc        = "img_src"
//    case title         = "title"
//    case subTitle      = "sub_title"
//    case discount      = "discount"
//    case discountCode  = "discount_code"
//    case originalPrice = "original_price"
//    case discountRate  = "discount_rate"
//    case discountPrice = "discount_price"
//
//  }
//
//  init(from decoder: Decoder) throws {
//    let values = try decoder.container(keyedBy: CodingKeys.self)
//
//    id            = try values.decodeIfPresent(String.self , forKey: .id            )
//    eventDate     = try values.decodeIfPresent(String.self , forKey: .eventDate     )
//    likeYn        = try values.decodeIfPresent(String.self , forKey: .likeYn        )
//    imgSrc        = try values.decodeIfPresent(String.self , forKey: .imgSrc        )
//    title         = try values.decodeIfPresent(String.self , forKey: .title         )
//    subTitle      = try values.decodeIfPresent(String.self , forKey: .subTitle      )
//    discount      = try values.decodeIfPresent(String.self , forKey: .discount      )
//    discountCode  = try values.decodeIfPresent(String.self , forKey: .discountCode  )
//    originalPrice = try values.decodeIfPresent(String.self , forKey: .originalPrice )
//    discountRate  = try values.decodeIfPresent(String.self , forKey: .discountRate  )
//    discountPrice = try values.decodeIfPresent(String.self , forKey: .discountPrice )
//
//  }
//
//  init() {
//
//  }
//
//}
struct ExampleJson2KtSwift: Codable {

  var data : cateData?





}

struct cateData: Codable {

  var categoryId   : String? = nil
  var categoryText : String? = nil
  var item         : [JsonItem]? = []

  enum CodingKeys: String, CodingKey {

    case categoryId   = "category_id"
    case categoryText = "category_text"
    case item         = "item"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    categoryId   = try values.decodeIfPresent(String.self , forKey: .categoryId   )
    categoryText = try values.decodeIfPresent(String.self , forKey: .categoryText )
    item         = try values.decodeIfPresent([JsonItem].self , forKey: .item         )
 
  }

  init() {

  }

}


struct JsonItem: Codable {

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
