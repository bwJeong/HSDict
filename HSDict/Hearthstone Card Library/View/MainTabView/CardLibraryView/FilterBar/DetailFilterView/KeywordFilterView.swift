//
//  KeywordFilterView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/07.
//

import SwiftUI

struct KeywordFilterView: View {
    @ObservedObject var cardManager: CardManager
    
    @Binding var isKeywordFilterClicked: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.filterViewBackgroundColor)
                .shadow(color: .black, radius: 3, y: 2)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("any-keyword")
                        .frame(width: 100, alignment: .leading)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.textYellow)
                        .padding(.vertical, 2)
                        .onTapGesture {
                            cardManager.setKeywordInfo(keywordInfo: "keywords-button-title")
                            isKeywordFilterClicked.toggle()
                        }
                    
                    ForEach(keywordInfos.map { $0.1 }, id: \.self) { keywordInfo in
                        Text(LocalizedStringKey(keywordInfo))
                            .frame(width: 100, alignment: .leading)
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.textWhite)
                            .padding(.vertical, 2)
                            .onTapGesture {
                                cardManager.setKeywordInfo(keywordInfo: keywordInfo)
                                isKeywordFilterClicked.toggle()
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

struct KeywordFilterView_Previews: PreviewProvider {
    static var previews: some View {
        KeywordFilterView(cardManager: CardManager(), isKeywordFilterClicked: .constant(true))
    }
}
