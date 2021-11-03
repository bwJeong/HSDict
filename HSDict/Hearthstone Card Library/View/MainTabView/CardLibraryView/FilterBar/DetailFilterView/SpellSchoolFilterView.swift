//
//  SpellSchoolFilterView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/07.
//

import SwiftUI

struct SpellSchoolFilterView: View {
    @ObservedObject var cardManager: CardManager
    
    @Binding var isSpellSchoolFilterClicked: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.filterViewBackgroundColor)
                .shadow(color: .black, radius: 3, y: 2)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("any-spell-school")
                        .frame(width: 100, alignment: .leading)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.textYellow)
                        .padding(.vertical, 2)
                        .onTapGesture {
                            cardManager.setSpellSchoolInfo(spellSchoolInfo: "spell-school-button-title")
                            isSpellSchoolFilterClicked.toggle()
                        }
                    
                    ForEach(spellSchoolInfos.map { $0.1 }, id: \.self) { spellSchoolInfo in
                        Text(LocalizedStringKey(spellSchoolInfo))
                            .frame(width: 100, alignment: .leading)
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.textWhite)
                            .padding(.vertical, 2)
                            .onTapGesture {
                                cardManager.setSpellSchoolInfo(spellSchoolInfo: spellSchoolInfo)
                                isSpellSchoolFilterClicked.toggle()
                            }
                    }
                }
                .padding(.vertical, 10)
                .padding(.leading, 10)
            }
        }
        .frame(width: 100, height: UIScreen.main.bounds.height * 0.25)
    }
}

struct SpellSchoolFilterView_Previews: PreviewProvider {
    static var previews: some View {
        SpellSchoolFilterView(cardManager: CardManager(), isSpellSchoolFilterClicked: .constant(true))
    }
}
