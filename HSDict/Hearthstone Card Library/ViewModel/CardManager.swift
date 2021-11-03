//
//  CardManager.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/04/30.
//

import Foundation

class CardManager: ObservableObject {
    private let apiManager = APIManager()
    private let baseURI = "https://kr.api.blizzard.com/hearthstone/cards"
    private var page: Int = 1
    private var pageCount: Int = 1
    var selectedCard: Card = Card.empty
    
    @Published var cards: [Card] = []
    @Published var cardCount: Int = 0
    
    // Filter
    @Published var cardSetInfo: String
    @Published var classInfo: String
    @Published var manaCostCheckArr: [Bool] = [false, false, false, false, false, false, false, false, false, false, false]
    @Published var textFilter: String = ""
    @Published var attack: String = ""
    @Published var health: String = ""
    @Published var cardTypeInfo: String = "card-type-button-title"
    @Published var minionTypeInfo: String = "minion-type-button-title"
    @Published var spellSchoolInfo: String = "spell-school-button-title"
    @Published var gradeInfo: String = "rarity-button-title"
    @Published var keywordInfo: String = "keywords-button-title"
    
    init(cardSetInfo: String = "standard", classInfo: String = "demonhunter") {
        self.cardSetInfo = cardSetInfo
        self.classInfo = classInfo
    }
    
    func getCards() {
        if page <= pageCount {
            apiManager.getCards(uri: self.makeURI()) { cards in
                self.cardCount = cards.cardCount
                self.pageCount = cards.pageCount
                self.cards += cards.cards
                
                if self.page <= self.pageCount {
                    self.page += 1
                }
            }
        }
    }
    
    func initialization() {
        page = 1
        pageCount = 1
        cards.removeAll()
    }
    
    func isAllFilterClear() -> Bool {
        if makeManaCostString().isEmpty && textFilter.isEmpty && attack.isEmpty && health.isEmpty
            && cardTypeInfo == "card-type-button-title"
            && minionTypeInfo == "minion-type-button-title"
            && spellSchoolInfo == "spell-school-button-title"
            && gradeInfo == "rarity-button-title"
            && keywordInfo == "keywords-button-title" {
            return true
        }
        
        return false
    }
    
    private func makeURI() -> String {
        let uri = baseURI
            + "?locale=\(Locale.current.languageCode == "ko" ? "ko_KR" : "en_US")"
            + "&sort=manaCost:asc"
            + "&pageSize=18"
            + "&page=\(page)"
            + "&set=\(cardSetInfo)"
            + "&class=\(classInfo)"
            + "&manaCost=\(makeManaCostString())"
            + "&textFilter=\(textFilter)"
            + "&attack=\(attack)"
            + "&health=\(health)"
            + "&type=\(cardTypeInfo == "card-type-button-title" ? "" : cardTypeInfo)"
            + "&minionType=\(minionTypeInfo == "minion-type-button-title" ? "" : minionTypeInfo)"
            + "&spellSchool=\(spellSchoolInfo == "spell-school-button-title" ? "" : spellSchoolInfo)"
            + "&rarity=\(gradeInfo == "rarity-button-title" ? "" : gradeInfo)"
            + "&keyword=\(keywordInfo == "keywords-button-title" ? "" : keywordInfo)"
        
        return uri
    }
    
    func makeManaCostString() -> String {
        var manaCostArr: [String] = []
        
        for (index, manaCostCheck) in manaCostCheckArr.enumerated() {
            if manaCostCheck {
                manaCostArr.append(String(index))
            }
        }
        
        return manaCostArr.joined(separator: ",")
        
    }
}

// MARK: - Set & Clear Filter
extension CardManager {
    func setCardSetInfo(cardSetInfo: String) {
        if self.cardSetInfo != cardSetInfo {
            self.cardSetInfo = cardSetInfo
            initialization()
            getCards()
        }
    }
    
    func setClassInfo(classInfo: String) {
        if self.classInfo != classInfo {
            self.classInfo = classInfo
            initialization()
            getCards()
        }
    }
    
    func toggleManaCostCheckArr(selectedCost: Int) {
        manaCostCheckArr[selectedCost].toggle()
        initialization()
        getCards()
    }
    
    func clearManaCostCheckArr() {
        for i in 0 ..< manaCostCheckArr.count {
            manaCostCheckArr[i] = false
        }
        
        initialization()
        getCards()
    }
    
    func setTextFilter(textFilter: String) {
        if self.textFilter != textFilter {
            self.textFilter = textFilter
            initialization()
            getCards()
        }
    }
    
    func setAttack(attack: String) {
        if self.attack != attack {
            self.attack = attack
            initialization()
            getCards()
        }
    }
    
    func setHealth(health: String) {
        if self.health != health {
            self.health = health
            initialization()
            getCards()
        }
    }
    
    func setCardTypeInfo(cardTypeInfo: String) {
        if self.cardTypeInfo != cardTypeInfo {
            self.cardTypeInfo = cardTypeInfo
            initialization()
            getCards()
        }
    }
    
    func setMinionTypeInfo(minionTypeInfo: String) {
        if self.minionTypeInfo != minionTypeInfo {
            self.minionTypeInfo = minionTypeInfo
            initialization()
            getCards()
        }
    }
    
    func setSpellSchoolInfo(spellSchoolInfo: String) {
        if self.spellSchoolInfo != spellSchoolInfo {
            self.spellSchoolInfo = spellSchoolInfo
            initialization()
            getCards()
        }
    }
    
    func setGradeInfo(gradeInfo: String) {
        if self.gradeInfo != gradeInfo {
            self.gradeInfo = gradeInfo
            initialization()
            getCards()
        }
    }
    
    func setKeywordInfo(keywordInfo: String) {
        if self.keywordInfo != keywordInfo {
            self.keywordInfo = keywordInfo
            initialization()
            getCards()
        }
    }
}
