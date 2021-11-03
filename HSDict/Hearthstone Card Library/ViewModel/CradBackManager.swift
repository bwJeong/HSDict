//
//  CradBackManager.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/04/30.
//

import Foundation

class CardBackManager: ObservableObject {
    private let apiManager = APIManager()
    private let baseURI = "https://kr.api.blizzard.com/hearthstone/cardbacks"
    private var page: Int = 1
    private var pageCount: Int = 1
    var selectedCardBack: CardBack = CardBack.empty

    @Published var cardBacks: [CardBack] = []
    @Published var cardCount: Int = 0
    
    func getCardBacks() {
        if page <= pageCount {
            apiManager.getCardBacks(uri: self.makeURI()) { cardBacks in
                self.cardCount = cardBacks.cardCount
                self.pageCount = cardBacks.pageCount
                self.cardBacks += cardBacks.cardBacks
                
                if self.page <= self.pageCount {
                    self.page += 1
                }
            }
        }
    }
    
    private func makeURI() -> String {
        // Blizzard API Bug Issue: "sort=dateAdded:desc" is not working!
        let uri = baseURI
            + "?locale=\(Locale.current.languageCode == "ko" ? "ko_KR" : "en_US")"
            + "&sort=dateAdded:asc"
            + "&pageSize=18"
            + "&page=\(page)"
        
        return uri
    }
}
