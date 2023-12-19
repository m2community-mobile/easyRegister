////
////  ListSection.swift
////  MultiSectionCompositionalLayout
////
////  Created by Emmanuel Okwara on 15.05.22.
////
//
//import Foundation
//
//enum ListSection {
//    case stories([Banner])
//    case popular([Banner])
//    case comingSoon([Banner])
//
//    var items: [Banner] {
//        switch self {
//        case .stories(let items),
//                .popular(let items),
//                .comingSoon(let items):
//            return items
//        }
//    }
//
//    var count: Int {
//        return items.count
//    }
//
//    var title: String {
//        switch self {
//        case .stories:
//            return ""
//        case .popular:
//            return "category"
//        case .comingSoon:
//
//            //            for (index, value) in myTitle.enumerated() {
//            //                print("Index: \(index), Value: \(value)")
////        }
//
//            //            for i in myTitle {
//            //                print("count\(i)")
//            //                return i
//            //            }
//
//            return "menu"
//
//        }
//    }
//}


import Foundation



enum ListSection {
    case stories([DataClass])
    case popular([DataClass])
    case comingSoon([DataClass])
    
    var items: [DataClass] {
        switch self {
        case .stories(let items),
                .popular(let items),
                .comingSoon(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: [String] {
        switch self {
        case .stories:
            return [""]
        case .popular:
            return myTitle
        case .comingSoon:
            
         
          
            return myTitle
        }
    }
}

