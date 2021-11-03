//
//  CardTypeFilterView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/07.
//

import SwiftUI

struct CardTypeFilterView: View {
    @ObservedObject var cardManager: CardManager
    
    @Binding var isCardTypeFilterClicked: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.filterViewBackgroundColor)
                .shadow(color: .black, radius: 3, y: 2)
            
            VStack(alignment: .leading) {
                Text("any-card-type")
                    .frame(width: 100, alignment: .leading)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.textYellow)
                    .padding(.vertical, 2)
                    .onTapGesture {
                        cardManager.setCardTypeInfo(cardTypeInfo: "card-type-button-title")
                        isCardTypeFilterClicked.toggle()
                    }
                
                ForEach(cardTypeInfos.map { $0.1 }, id: \.self) { cardTypeInfo in
                    Text(LocalizedStringKey(cardTypeInfo))
                        .frame(width: 100, alignment: .leading)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.textWhite)
                        .padding(.vertical, 2)
                        .onTapGesture {
                            cardManager.setCardTypeInfo(cardTypeInfo: cardTypeInfo)
                            isCardTypeFilterClicked.toggle()
                        }
                }
            }
            .padding(.vertical, 10)
            .padding(.leading, 10)
            
        }
        .frame(width: 100, height: 143)
    }
}

struct CardTypeFilterView_Previews: PreviewProvider {
    static var previews: some View {
        CardTypeFilterView(cardManager: CardManager(), isCardTypeFilterClicked: .constant(true))
    }
}
