//
//  CardBackLibraryView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/06.
//

import SwiftUI
import Kingfisher

struct CardBackLibraryView: View {
    @ObservedObject var cardBackManager: CardBackManager
    
    @Binding var isCardBackClicked: Bool
    
    var body: some View {
        ZStack {
            Color.cardLibraryViewBackgroundColor
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                HStack {
                    Text("filtered-card-backs-info \(cardBackManager.cardCount)")
                        .foregroundColor(.textDarkBrown)
                        .font(.system(size: 10, weight: .bold))
                    
                    Spacer()
                }
                .padding(.horizontal, 8)
                .padding(.top, 10)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: UIScreen.main.bounds.width * 0.3))], spacing: 30, content: {
                    ForEach(cardBackManager.cardBacks) { cardBack in
                        KFImage(URL(string: cardBack.image))
                            .onSuccess { _ in
                                if let lastCardBack = cardBackManager.cardBacks.last {
                                    if lastCardBack.id == cardBack.id {
                                        cardBackManager.getCardBacks()
                                    }
                                }
                            }
                            .resizable()
                            .scaledToFit()
                            .shadow(color: .black, radius: 4)
                            .padding(.horizontal, 5)
                            .onTapGesture {
                                cardBackManager.selectedCardBack = cardBack
                                isCardBackClicked.toggle()
                            }
                    }
                })
                .padding(.vertical, 10)
            }
        }
        .onAppear {
            if cardBackManager.cardBacks.isEmpty {
                cardBackManager.getCardBacks()
            }
        }
    }
}

struct CardBackLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        CardBackLibraryView(cardBackManager: CardBackManager(), isCardBackClicked: .constant(false))
    }
}
