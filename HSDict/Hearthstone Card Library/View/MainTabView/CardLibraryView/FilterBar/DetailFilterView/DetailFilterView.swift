//
//  DetailFilterView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/07.
//

import SwiftUI

struct DetailFilterView: View {
    @ObservedObject var cardManager: CardManager
    
    @State var isAttackFilterClicked: Bool = false
    @State var isHealthFilterClicked: Bool = false
    @State var isCardTypeFilterClicked: Bool = false
    @State var isMinionTypeFilterClicked: Bool = false
    @State var isSpellSchoolFilterClicked: Bool = false
    @State var isGradeFilterClicked: Bool = false
    @State var isKeywordFilterClicked: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 290, height: 105)
                    .foregroundColor(.filterBarBackgroundColor)
                    .shadow(color: .black, radius: 3, y: 2)
                
                VStack {
                    HStack {
                        FilterButton(title: "attack", value: cardManager.attack, isFilterClicked: $isAttackFilterClicked)
                        
                        FilterButton(title: "health", value: cardManager.health, isFilterClicked: $isHealthFilterClicked)
                        
                        FilterButton(title: cardManager.cardTypeInfo, isFilterClicked: $isCardTypeFilterClicked)
                    }
                    .padding(.bottom, 1)
                    
                    HStack {
                        FilterButton(title: cardManager.minionTypeInfo, isFilterClicked: $isMinionTypeFilterClicked)
                        
                        FilterButton(title: cardManager.spellSchoolInfo, isFilterClicked: $isSpellSchoolFilterClicked)
                        
                        FilterButton(title: cardManager.gradeInfo, isFilterClicked: $isGradeFilterClicked)
                    }
                    .padding(.bottom, 1)
                    
                    HStack {
                        FilterButton(title: cardManager.keywordInfo, isFilterClicked: $isKeywordFilterClicked)
                        
                        Spacer()
                    }
                    .frame(width: 280)
                }
            }
            
            if isAttackFilterClicked {
                HStack {
                    AttackFilterView(cardManager: cardManager, isAttackFilterClicked: $isAttackFilterClicked)
                        .offset(x: 8, y: 110)

                    Spacer()
                }
            }
            
            if isHealthFilterClicked {
                HStack {
                    HealthFilterView(cardManager: cardManager, isHealthFilterClicked: $isHealthFilterClicked)
                        .offset(y: 110)
                }
            }
            
            if isCardTypeFilterClicked {
                HStack {
                    Spacer()
                    
                    CardTypeFilterView(cardManager: cardManager, isCardTypeFilterClicked: $isCardTypeFilterClicked)
                        .offset(x: -8, y: 110)
                }
            }
            
            if isMinionTypeFilterClicked {
                HStack {
                    MinionTypeFilterView(cardManager: cardManager, isMinionTypeFilterClicked: $isMinionTypeFilterClicked)
                        .offset(x: 8, y: 110)
                    
                    Spacer()
                }
            }
            
            if isSpellSchoolFilterClicked {
                HStack {
                    SpellSchoolFilterView(cardManager: cardManager, isSpellSchoolFilterClicked: $isSpellSchoolFilterClicked)
                        .offset(y: 110)
                }
            }
            
            if isGradeFilterClicked {
                HStack {
                    Spacer()
                    
                    GradeFilterView(cardManager: cardManager, isGradeFilterClicked: $isGradeFilterClicked)
                        .offset(x: -8, y: 110)
                }
            }
            
            if isKeywordFilterClicked {
                HStack {
                    KeywordFilterView(cardManager: cardManager, isKeywordFilterClicked: $isKeywordFilterClicked)
                        .offset(x: 8, y: 110)
                    
                    Spacer()
                }
            }
        }
        .frame(width: 290 + 5)
        .onChange(of: isAttackFilterClicked) { _ in
            if isAttackFilterClicked {
                isHealthFilterClicked = false
                isCardTypeFilterClicked = false
                isMinionTypeFilterClicked = false
                isSpellSchoolFilterClicked = false
                isGradeFilterClicked = false
                isKeywordFilterClicked = false
            }
        }
        .onChange(of: isHealthFilterClicked) { _ in
            if isHealthFilterClicked {
                isAttackFilterClicked = false
                isCardTypeFilterClicked = false
                isMinionTypeFilterClicked = false
                isSpellSchoolFilterClicked = false
                isGradeFilterClicked = false
                isKeywordFilterClicked = false
            }
        }
        .onChange(of: isCardTypeFilterClicked) { _ in
            if isCardTypeFilterClicked {
                isAttackFilterClicked = false
                isHealthFilterClicked = false
                isMinionTypeFilterClicked = false
                isSpellSchoolFilterClicked = false
                isGradeFilterClicked = false
                isKeywordFilterClicked = false
            }
        }
        .onChange(of: isMinionTypeFilterClicked) { _ in
            if isMinionTypeFilterClicked {
                isAttackFilterClicked = false
                isHealthFilterClicked = false
                isCardTypeFilterClicked = false
                isSpellSchoolFilterClicked = false
                isGradeFilterClicked = false
                isKeywordFilterClicked = false
            }
        }
        .onChange(of: isSpellSchoolFilterClicked) { _ in
            if isSpellSchoolFilterClicked {
                isAttackFilterClicked = false
                isHealthFilterClicked = false
                isCardTypeFilterClicked = false
                isMinionTypeFilterClicked = false
                isGradeFilterClicked = false
                isKeywordFilterClicked = false
            }
        }
        .onChange(of: isGradeFilterClicked) { _ in
            if isGradeFilterClicked {
                isAttackFilterClicked = false
                isHealthFilterClicked = false
                isCardTypeFilterClicked = false
                isMinionTypeFilterClicked = false
                isSpellSchoolFilterClicked = false
                isKeywordFilterClicked = false
            }
        }
        .onChange(of: isKeywordFilterClicked) { _ in
            if isKeywordFilterClicked {
                isAttackFilterClicked = false
                isHealthFilterClicked = false
                isCardTypeFilterClicked = false
                isMinionTypeFilterClicked = false
                isSpellSchoolFilterClicked = false
                isGradeFilterClicked = false
            }
        }
    }
}

fileprivate struct FilterButton: View {
    let title: String
    let value: String
    
    @Binding var isFilterClicked: Bool
    
    init(title: String, value: String = "", isFilterClicked: Binding<Bool>) {
        self.title = title
        self.value = value
        self._isFilterClicked = isFilterClicked
    }
    
    var body: some View {
        HStack {
            if title == "attack" {
                Text(value.isEmpty ? "attack-button-title" : value == "10" ? "attack: \("10+")" : "attack: \(value)")
                    .frame(width: 50, height: 25, alignment: .leading)
                    .foregroundColor(.textDarkBrown)
                    .font(.system(size: 10, weight: .bold))
                    .lineLimit(1)
                    .padding(.leading, 10)
            } else if title == "health" {
                Text(value.isEmpty ? "health-button-title" : value == "10" ? "health: \("10+")" : "health: \(value)")
                    .frame(width: 50, height: 25, alignment: .leading)
                    .foregroundColor(.textDarkBrown)
                    .font(.system(size: 10, weight: .bold))
                    .lineLimit(1)
                    .padding(.leading, 10)
            } else {
                Text(LocalizedStringKey(title))
                    .frame(width: 50, height: 25, alignment: .leading)
                    .foregroundColor(.textDarkBrown)
                    .font(.system(size: 10, weight: .bold))
                    .lineLimit(1)
                    .padding(.leading, 10)
            }
            
            Image(systemName: isFilterClicked ? "chevron.up" : "chevron.down")
                .frame(width: 10, height: 25)
                .foregroundColor(.textDarkBrown)
                .font(.system(size: 10))
                .padding(.trailing, 10)
        }
        .background(isFilterClicked ? Color.filterBarButtonBackgroundColorWhenClicked : Color.filterBarButtonBackgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 40))
        .overlay(
            RoundedRectangle(cornerRadius: 40.0)
                .stroke(isFilterClicked ? Color.filterBarButtonBoderColorWhenClicked : Color.filterBarButtonBoderColor, lineWidth: 2)
        )
        .shadow(radius: 3)
        .onTapGesture {
            isFilterClicked.toggle()
        }
    }
}

struct DetailFilterView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DetailFilterView(cardManager: CardManager())
            
            Spacer()
        }
    }
}
