//
//  MockData.swift
//  MultiSectionCompositionalLayout
//
//  Created by Emmanuel Okwara on 21.05.22.
//

import Foundation




struct MockData {
    
    static let shared = MockData()
    

    

    private let stories: ListSection = {
        .stories([.init(famousCategory: FamousCategory(category: [Category(id: "", title: "")]), topBanner: TopBanner(cnt: 0, banner: [Banner(id: "", imgSrc: "")]), menuList: MenuList(menu: [Menu(id: "", title: "", subTitle: "", index: "", type: "", cnt: "", item: [Item(id: "", eventDate: "", likeYn: "", imgSrc: "", title: "", itemSubTitle: "", discount: "", discountCode: "", originalPrice: "", discountRate: "", discountPrice: "", subTitle: "")])]))])
//        .stories([.init(id: "", imgSrc: "")])
//                  .init(id: "", imgSrc: "profile-2"),
//                  .init(id: "", imgSrc: "profile-3"),
//                  .init(id: "", imgSrc: "profile-4"),
//                  .init(id: "", imgSrc: "profile-5"),
//                  .init(id: "", imgSrc: "profile-6"),
//                  .init(id: "", imgSrc: "profile-7"),
//                  .init(id: "", imgSrc: "profile-8")])
    }()
//
    private let popular: ListSection = {
//
        .popular([.init(famousCategory: FamousCategory(category: [Category(id: "", title: "")]), topBanner: TopBanner(cnt: 0, banner: [Banner(id: "", imgSrc: "")]), menuList: MenuList(menu: [Menu(id: "", title: "", subTitle: "", index: "", type: "", cnt: "", item: [Item(id: "", eventDate: "", likeYn: "", imgSrc: "", title: "", itemSubTitle: "", discount: "", discountCode: "", originalPrice: "", discountRate: "", discountPrice: "", subTitle: "")])]))])
//
//
//        .popular([.init(id: "", imgSrc: "")])
//                  .init(id: "", imgSrc: ""),
//                  .init(id: "", imgSrc: "")
//                  ])
////        .popular([.init(id: "Naruto", imgSrc: "popular-1"),
////                  .init(id: "Jujutsu Kaisen", imgSrc: "popular-2"),
////                  .init(id: "Demon Slayer", imgSrc: "popular-3"),
////                  .init(id: "One Piece", imgSrc: "popular-4"),
////                  .init(id: "Seven Deadly Sins", imgSrc: "popular-5")])
    }()
//
    private let comingSoon: ListSection = {
        .comingSoon([.init(famousCategory: FamousCategory(category: [Category(id: "", title: "")]), topBanner: TopBanner(cnt: 0, banner: [Banner(id: "", imgSrc: "")]), menuList: MenuList(menu: [Menu(id: "", title: "", subTitle: "", index: "", type: "", cnt: "", item: [Item(id: "", eventDate: "", likeYn: "", imgSrc: "", title: "", itemSubTitle: "", discount: "", discountCode: "", originalPrice: "", discountRate: "", discountPrice: "", subTitle: "")])]))])
        
//                     .init(id: "Record of Ragnarok", imgSrc: "soon-2"),
//                     .init(id: "Kaisen Returns", imgSrc: "soon-3"),
//                     .init(id: "No Idea", imgSrc: "soon-4"),
//                     .init(id: "Looks interesting", imgSrc: "soon-5")])
    }()

    var pageData: [ListSection] {
//        [popular, comingSoon, popular, stories]
//        return [stories, comingSoon, popular]
        return [stories, comingSoon, popular, comingSoon, comingSoon, popular, comingSoon]
    }
}
