//
//  Card.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/04/30.
//

import Foundation

struct Cards: Codable {
    let cards: [Card]
    let cardCount: Int
    let pageCount: Int
    let page: Int
}

struct Card: Identifiable, Codable {
    let id: Int
    let collectible: Int
    let slug: String
    let classId: Int
    let multiClassIds: [Int]
    let spellSchoolId: Int?
    let minionTypeId: Int?
    let cardTypeId: Int
    let cardSetId: Int
    let rarityId: Int
    let artistName: String?
    let health: Int?
    let attack: Int?
    let manaCost: Int
    let durability: Int?
    let name: String
    let text: String
    let image: String
    let flavorText: String
    let cropImage: String
    let parentId: Int?
    let childIds: [Int]?
    let keywordIds: [Int]?
}

// MARK: - Method

extension Card {
    func getCardSetName() -> String {
        if let standardSetInfo = (standardSetInfos.filter { $0.0 == cardSetId }.first) {
            return standardSetInfo.1
        } else if let wildSetInfo = (wildSetInfos.filter { $0.0 == cardSetId }.first) {
            return wildSetInfo.1
        } else if classicSetInfo.0 == cardSetId {
            return classicSetInfo.1
        } else if cardSetId == 3 || cardSetId == 4 { // aliasSetIds: 3, 4 -> 1635
            return "legacy"
        }
        
        return "N/A"
    }
    
    func getClassName(classId: Int) -> String {
        if let classInfo = (classInfos.filter { $0.0 == classId }.first) {
            return classInfo.1
        }
        
        return "N/A"
    }
        
    func getMultiClassName() -> [String] {
        var multiClassArr: [String] = []
        
        for eachClass in multiClassIds {
            multiClassArr.append(getClassName(classId: eachClass))
        }
        
        return multiClassArr.sorted { $0 < $1 }
    }
    
    func getCardTypeName() -> String {
        if let cardTypeInfo = (cardTypeInfos.filter { $0.0 == cardTypeId }.first) {
            return cardTypeInfo.1
        }
        
        return "N/A"
    }
    
    func getMinionTypeName() -> String {
        if let minionTypeInfo = (minionTypeInfos.filter { $0.0 == minionTypeId }.first) {
            return minionTypeInfo.1
        }
        
        return "N/A"
    }
    
    func getSpellSchoolName() -> String {
        if let spellSchoolInfo = (spellSchoolInfos.filter { $0.0 == spellSchoolId }.first) {
            return spellSchoolInfo.1
        }
        
        return "N/A"
    }
    
    func getGrade() -> String {
        if let gradeInfo = (gradeInfos.filter { $0.0 == rarityId }.first) {
            return gradeInfo.1
        }
        
        return "N/A"
    }
    
    func getKeywordNameAndDescriptions() -> [[String]] {
        var identifiedKeywordNameAndDescriptions: [[String]] = []
        
        for keywordId in keywordIds! {
            if let keywordInfo = (keywordInfos.filter { $0.0 == keywordId }.first) {
                identifiedKeywordNameAndDescriptions.append([keywordInfo.1, keywordInfo.2])
            }
        }
        
        return identifiedKeywordNameAndDescriptions
    }
    
    func getCraftCost() -> String {
        switch self.rarityId {
        case 1:
            return "common-cost-to-craft"
        case 3:
            return "rare-cost-to-craft"
        case 4:
            return "epic-cost-to-craft"
        case 5:
            return "legendary-cost-to-craft"
        default:
            return "N/A"
        }
    }
    
    func getDisenchantingYield() -> String {
        switch self.rarityId {
        case 1:
            return "common-disenchanting-yield"
        case 3:
            return "rare-disenchanting-yield"
        case 4:
            return "epic-disenchanting-yield"
        case 5:
            return "legendary-disenchanting-yield"
        default:
            return "N/A"
        }
    }
}

// MARK: - Empty

extension Card {
    static let empty = Card(id: -1, collectible: -1, slug: "", classId: -1, multiClassIds: [], spellSchoolId: -1, minionTypeId: -1, cardTypeId: -1, cardSetId: -1, rarityId: -1, artistName: "", health: -1, attack: -1, manaCost: -1, durability: -1, name: "", text: "", image: "", flavorText: "", cropImage: "", parentId: -1, childIds: [], keywordIds: [])
}
