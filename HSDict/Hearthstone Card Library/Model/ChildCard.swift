//
//  ChildCard.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/05.
//

import Foundation

struct ChildCard: Identifiable, Codable {
    let id: Int
    let name: String
    let image: String
}

// MARK: - Empty

extension ChildCard {
    static let empty = ChildCard(id: -1, name: "", image: "")
}
