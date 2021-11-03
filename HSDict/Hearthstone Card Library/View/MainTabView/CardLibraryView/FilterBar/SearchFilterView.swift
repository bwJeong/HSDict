//
//  SearchFilterView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/06.
//

import SwiftUI

struct SearchFilterView: View {
    @ObservedObject var cardManager: CardManager
    
    @State var text: String = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 150, height: 30)
                .foregroundColor(.filterBarBackgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.filterBarButtonBoderColor, lineWidth: 2)
                )
                .shadow(color: .black, radius: 3, y: 2)
            
            HStack {
                ZStack(alignment: .leading) {
                    if text.isEmpty {
                        Text("search-textfield-placeholder")
                            .foregroundColor(.textBrown)
                            .font(.system(size: 10))
                            .padding(.leading, 15)
                    }
                    
                    TextField("", text: $text, onCommit:  {
                        cardManager.setTextFilter(textFilter: text)
                    })
                    .padding(.leading, 15)
                    .foregroundColor(.textWhite)
                    .accentColor(.textWhite)
                    .font(.system(size: 10, weight: .bold))
                    .disableAutocorrection(true)
                }
                
                Image(systemName: text.isEmpty ? "magnifyingglass" : "xmark")
                    .foregroundColor(.itemYellow)
                    .font(.system(size: 20))
                    .frame(width: 50, height: 25)
                    .shadow(color: .black, radius: 1)
                    .onTapGesture {
                        text = ""
                        cardManager.setTextFilter(textFilter: text)
                    }
            }
        }
        .frame(width: 150 + 8, height: 30)
    }
}

struct SearchFilterView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFilterView(cardManager: CardManager())
    }
}
