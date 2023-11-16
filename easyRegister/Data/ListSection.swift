//
//  ListSection.swift
//  MultiSectionCompositionalLayout
//
//  Created by Emmanuel Okwara on 15.05.22.
//

import Foundation

enum ListSection {
    case stories([Banner])
    case popular([Banner])
    case comingSoon([Banner])
    
    var items: [Banner] {
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
    
    var title: String {
        switch self {
        case .stories:
            return "Stories"
        case .popular:
            return "category"
        case .comingSoon:
            return "menu"
        }
    }
}
