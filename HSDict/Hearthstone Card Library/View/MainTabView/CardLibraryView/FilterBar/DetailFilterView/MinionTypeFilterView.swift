//
//  MinionTypeFilterView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/07.
//

import SwiftUI

struct MinionTypeFilterView: View {
    @ObservedObject var cardManager: CardManager
    
    @Binding var isMinionTypeFilterClicked: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.filterViewBackgroundColor)
                .shadow(color: .black, radius: 3, y: 2)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("any-minion-type")
                        .frame(width: 100, alignment: .leading)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.textYellow)
                        .padding(.vertical, 2)
                        .onTapGesture {
                            cardManager.setMinionTypeInfo(minionTypeInfo: "minion-type-button-title")
                            isMinionTypeFilterClicked.toggle()
                        }
                    
                    ForEach(minionTypeInfos.map { $0.1 }, id: \.self) { minionTypeInfo in
                        Text(LocalizedStringKey(minionTypeInfo))
                            .frame(width: 100, alignment: .leading)
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.textWhite)
                            .padding(.vertical, 2)
                            .onTapGesture {
                                cardManager.setMinionTypeInfo(minionTypeInfo: minionTypeInfo)
                                isMinionTypeFilterClicked.toggle()
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

struct MinionTypeFilterView_Previews: PreviewProvider {
    static var previews: some View {
        MinionTypeFilterView(cardManager: CardManager(), isMinionTypeFilterClicked: .constant(true))
    }
}
