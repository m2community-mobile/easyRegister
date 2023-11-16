//
//  Data.swift
//  accordingJsonCollecionView
//
//  Created by m2comm on 2023/10/26.
//

import Foundation

// MARK: - Welcome
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
    let item: [Item]

    enum CodingKeys: String, CodingKey {
        case id, title
        case subTitle = "sub_title"
        case index, type, cnt, item
    }
}

// MARK: - Item
struct Item: Codable {
    let id: String
    let likeYn: Discount
    let imgSrc: String
    let title: String
    let subTitle: String
    let discount: Discount
    let discountCode: DiscountCode
    let originalPrice, discountPrice: String

    enum CodingKeys: String, CodingKey {
        case id
        case likeYn = "like_yn"
        case imgSrc = "img_src"
        case title
        case subTitle = "sub_title"
        case discount
        case discountCode = "discount_code"
        case originalPrice = "original_price"
        case discountPrice = "discount_price"
    }
}

enum Discount: String, Codable {
    case n = "N"
    case y = "Y"
}

enum DiscountCode: String, Codable {
    case a123 = "A123"
    case empty = ""
}

enum SubTitle: String, Codable {
    case empty = ""
    case 작은설명123123 = "작은설명123123"
    case 작은설명156156 = "작은설명156156"
    case 작은설명456456 = "작은설명456456"
    case 작은설명789789 = "작은설명789789"
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
