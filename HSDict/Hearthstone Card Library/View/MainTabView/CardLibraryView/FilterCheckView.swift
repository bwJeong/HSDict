//
//  FilterCheckView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/10.
//

import SwiftUI

struct FilterCheckView: View {
    @ObservedObject var cardManager: CardManager
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                if !cardManager.makeManaCostString().isEmpty {
                    FilterButton(title: "mana", value: cardManager.makeManaCostString())
                        .onTapGesture {
                            cardManager.clearManaCostCheckArr()
                        }
                }
                
                if !cardManager.textFilter.isEmpty {
                    FilterButton(title: cardManager.textFilter)
                        .onTapGesture {
                            cardManager.setTextFilter(textFilter: "")
                        }
                }
                
                if !cardManager.attack.isEmpty {
                    FilterButton(title: "attack", value: cardManager.attack)
                        .onTapGesture {
                            cardManager.setAttack(attack: "")
                        }
                }
                
                if !cardManager.health.isEmpty {
                    FilterButton(title: "health", value: cardManager.health)
                        .onTapGesture {
                            cardManager.setHealth(health: "")
                        }
                }
                
                if cardManager.cardTypeInfo != "card-type-button-title" {
                    FilterButton(title: cardManager.cardTypeInfo)
                        .onTapGesture {
                            cardManager.setCardTypeInfo(cardTypeInfo: "card-type-button-title")
                        }
                }
                
                if cardManager.minionTypeInfo != "minion-type-button-title" {
                    FilterButton(title: cardManager.minionTypeInfo)
                        .onTapGesture {
                            cardManager.setMinionTypeInfo(minionTypeInfo: "minion-type-button-title")
                        }
                }
                
                if cardManager.spellSchoolInfo != "spell-school-button-title" {
                    FilterButton(title: cardManager.spellSchoolInfo)
                        .onTapGesture {
                            cardManager.setSpellSchoolInfo(spellSchoolInfo: "spell-school-button-title")
                        }
                }
                
                if cardManager.gradeInfo != "rarity-button-title" {
                    FilterButton(title: cardManager.gradeInfo)
                        .onTapGesture {
                            cardManager.setGradeInfo(gradeInfo: "rarity-button-title")
                        }
                }
                
                if cardManager.keywordInfo != "keywords-button-title" {
                    FilterButton(title: cardManager.keywordInfo)
                        .onTapGesture {
                            cardManager.setKeywordInfo(keywordInfo: "keywords-button-title")
                        }
                }
                
                Spacer()
            }
            .padding(.leading, 8)
        }
    }
}

fileprivate struct FilterButton: View {
    let title: String
    let value: String
    
    init(title: String, value: String = "") {
        self.title = title
        self.value = value
    }
    
    var body: some View {
        HStack {
            if title == "mana" {
                Text("mana: \(value)")
                    .frame(height: 20, alignment: .leading)
                    .foregroundColor(.white)
                    .font(.system(size: 10, weight: .bold))
                    .padding(.leading, 8)
            } else if title == "attack" {
                Text(value == "10" ? "attack: \("10+")" : "attack: \(value)")
                    .frame(height: 20, alignment: .leading)
                    .foregroundColor(.white)
                    .font(.system(size: 10, weight: .bold))
                    .padding(.leading, 8)
            } else if title == "health" {
                Text(value == "10" ? "health: \("10+")" : "health: \(value)")
                    .frame(height: 20, alignment: .leading)
                    .foregroundColor(.white)
                    .font(.system(size: 10, weight: .bold))
                    .padding(.leading, 8)
            } else {
                Text(LocalizedStringKey(title))
                    .frame(height: 20, alignment: .leading)
                    .foregroundColor(.white)
                    .font(.system(size: 10, weight: .bold))
                    .padding(.leading, 8)
            }
            
            Image(systemName: "xmark")
                .frame(width: 10, height: 20)
                .foregroundColor(Color(#colorLiteral(red: 0.9491184354, green: 0.7887737155, blue: 0.2560161352, alpha: 1)))
                .font(.system(size: 10))
                .padding(.trailing, 8)
        }
        .background(Color(#colorLiteral(red: 0.3807471395, green: 0.2629181147, blue: 0.1508009732, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

struct FilterCheckView_Previews: PreviewProvider {
    static var previews: some View {
        FilterButton(title: "attack", value: "10")
    }
}
