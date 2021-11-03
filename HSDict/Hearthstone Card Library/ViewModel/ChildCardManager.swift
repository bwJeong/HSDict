//
//  ChildCardManager.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/05.
//

import Foundation

class ChildCardManager: ObservableObject {
    private let apiManager = APIManager()
    private let baseURI = "https://kr.api.blizzard.com/hearthstone/cards"
    var selectedChildCard: ChildCard = ChildCard.empty
    
    @Published var childCards: [ChildCard] = []
        
    func getChildCards(card: Card) {
        if let childIds = card.childIds {
            for childId in childIds {
                let uri = baseURI + "/\(childId)" + "?locale=\(Locale.current.languageCode == "ko" ? "ko_KR" : "en_US")"
                
                apiManager.getChildCard(uri: uri) { childCard in
                    self.childCards.append(childCard)
                }
            }
        }
    }
}
