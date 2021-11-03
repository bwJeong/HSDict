//
//  CardSetFilterView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/06.
//

import SwiftUI

struct CardSetFilterView: View {
    @ObservedObject var cardManager: CardManager
    
    @Binding var isCardSetFilterClicked: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.filterViewBackgroundColor)
                .shadow(color: .black, radius: 3, y: 2)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("standard")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.textWhite)
                        .padding(.vertical, 2)
                        .onTapGesture {
                            cardManager.setCardSetInfo(cardSetInfo: "standard")
                            isCardSetFilterClicked.toggle()
                        }
                    
                    Text("wild")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.textWhite)
                        .padding(.vertical, 2)
                        .onTapGesture {
                            cardManager.setCardSetInfo(cardSetInfo: "wild")
                            isCardSetFilterClicked.toggle()
                        }
                    
                    Text("classic-cards")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.textWhite)
                        .padding(.vertical, 2)
                        .onTapGesture {
                            cardManager.setCardSetInfo(cardSetInfo: classicSetInfo.1)
                            isCardSetFilterClicked.toggle()
                        }
                    
                    Text("standard")
                        .foregroundColor(.textGray)
                        .font(.system(size: 11))
                        .padding(.top, 10)
                    
                    ForEach(standardSetInfos.map { $0.1 }, id: \.self) { cardSetInfo in
                        Text(LocalizedStringKey(cardSetInfo))
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.textWhite)
                            .padding(.vertical, 2)
                            .onTapGesture {
                                cardManager.setCardSetInfo(cardSetInfo: cardSetInfo)
                                isCardSetFilterClicked.toggle()
                            }
                    }
                    
                    Text("wild")
                        .foregroundColor(.textGray)
                        .font(.system(size: 11))
                        .padding(.top, 10)
                    
                    ForEach(wildSetInfos.map { $0.1 }, id: \.self) { cardSetInfo in
                        Text(LocalizedStringKey(cardSetInfo))
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.textWhite)
                            .padding(.vertical, 2)
                            .onTapGesture {
                                cardManager.setCardSetInfo(cardSetInfo: cardSetInfo)
                                isCardSetFilterClicked.toggle()
                            }
                    }
                }
                .padding(.all, 10)
            }
        }
        .frame(width: 150, height: UIScreen.main.bounds.height * 0.25)
    }
}

struct CardSetFilterView_Previews: PreviewProvider {
    static var previews: some View {
        CardSetFilterView(cardManager: CardManager(), isCardSetFilterClicked: .constant(true))
    }
}
