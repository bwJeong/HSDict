//
//  CardLibraryView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/04.
//

import SwiftUI
import Kingfisher

struct CardLibraryView: View {
    @ObservedObject var cardManager: CardManager
    @ObservedObject var cardBackManager: CardBackManager
    
    @Binding var isCardClicked: Bool
    @Binding var isCardBackClicked: Bool
    
    @State var isCardBackButtonClicked: Bool = false
    
    init(cardManager: CardManager, cardBackManager: CardBackManager, isCardClicked: Binding<Bool>, isCardBackClicked: Binding<Bool>) {
        self.cardManager = cardManager
        self.cardBackManager = cardBackManager
        self._isCardClicked = isCardClicked
        self._isCardBackClicked = isCardBackClicked
        
        UINavigationBar.appearance().barTintColor = UIColor(Color.barBackgroundColor)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.cardLibraryViewBackgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    HStack {
                        Text("number-of-cards-found \(cardManager.cardCount)")
                            .foregroundColor(.textDarkBrown)
                            .font(.system(size: 10, weight: .bold))
                        
                        Text(LocalizedStringKey(cardManager.cardSetInfo))
                            .foregroundColor(.textDarkBrown)
                            .font(.system(size: 10, weight: .bold))
                            .lineLimit(1)
                        
                        Text("/")
                            .foregroundColor(.textDarkBrown)
                            .font(.system(size: 10, weight: .bold))
                        
                        Text(LocalizedStringKey(cardManager.classInfo))
                            .foregroundColor(.textDarkBrown)
                            .font(.system(size: 10, weight: .bold))
                            .lineLimit(1)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 8)
                    .padding(.top, 50)
                    
                    if !cardManager.isAllFilterClear() {
                        FilterCheckView(cardManager: cardManager)
                    }
                    
                    if cardManager.cards.isEmpty {
                        Text("no-cards-found")
                            .foregroundColor(.textDarkBrown)
                            .font(.system(size: 18, weight: .bold))
                            .frame(height: UIScreen.main.bounds.height * 0.6)
                    } else {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: UIScreen.main.bounds.width * 0.3))], spacing: 15, content: {
                            ForEach(cardManager.cards) { card in
                                KFImage(URL(string: card.image))
                                    .cancelOnDisappear(true)
                                    .onSuccess { _ in
                                        if let lastCard = cardManager.cards.last {
                                            if lastCard.id == card.id {
                                                cardManager.getCards()
                                            }
                                        }
                                    }
                                    .resizable()
                                    .scaledToFit()
                                    .shadow(color: .black, radius: 3)
                                    .padding(.leading, 5)
                                    .onTapGesture {
                                        cardManager.selectedCard = card
                                        isCardClicked.toggle()
                                    }
                            }
                        })
                        .padding(.bottom, 10)
                    }
                }
                
                VStack {
                    FilterBar(cardManager: cardManager)
                        .offset(y: 5)
                    
                    Spacer()
                }
                
                if isCardBackButtonClicked {
                    CardBackLibraryView(cardBackManager: cardBackManager, isCardBackClicked: $isCardBackClicked)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(isCardBackButtonClicked ? "card-back-navigation-title" : "card-navigation-title")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Text(isCardBackButtonClicked ? "card-back-navigation-button-title" : "card-navigation-button-title")
                            .font(.system(size: 11))
                            .foregroundColor(.itemYellow)
                            .fontWeight(.bold)
                        
                        Image(systemName: "chevron.forward")
                            .font(.system(size: 11))
                            .foregroundColor(.itemYellow)
                    }
                    .onTapGesture {
                        isCardBackButtonClicked.toggle()
                    }
                }
            }
        }
        .onAppear {
            if cardManager.cards.isEmpty {
                cardManager.getCards()
            }
        }
    }
}

struct CardLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        CardLibraryView(cardManager: CardManager(), cardBackManager: CardBackManager(), isCardClicked: .constant(false), isCardBackClicked: .constant(false))
    }
}
