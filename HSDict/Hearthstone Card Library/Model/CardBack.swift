//
//  CardBack.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/04/30.
//

import Foundation

struct CardBacks: Codable {
    let cardBacks: [CardBack]
    let cardCount: Int
    let pageCount: Int
    let page: Int
}

struct CardBack: Identifiable, Codable {
    let id: Int
    let image: String
    let name: String
    let slug: String
    let sortCategory: Int
    let text: String
}

// MARK: - Method

extension CardBack {
    func getSortCategoryName() -> String {
        if let sortCategoryInfo = (sortCategoryInfos.filter { $0.0 == sortCategory }.first) {
            return sortCategoryInfo.1
        }
        
        return "N/A"
    }
}

// MARK: - Empty

extension CardBack {
    static let empty = CardBack(id: -1, image: "", name: "", slug: "", sortCategory: -1, text: "")
}
