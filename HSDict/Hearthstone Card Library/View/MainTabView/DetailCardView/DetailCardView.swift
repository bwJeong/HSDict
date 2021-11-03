//
//  DetailCardView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/04.
//

import SwiftUI
import Kingfisher

struct DetailCardView: View {
    let card: Card
    
    @ObservedObject var childCardManager = ChildCardManager()
    
    @Binding var isCardClicked: Bool
    
    @State var isKeywordPressing: Bool = false
    @State var isChildCardPressing: Bool = false
    @State var selectedKeywordNameAndDescription: [String] = []
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.8)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    KFImage(URL(string: card.image))
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.width * 0.85)
                        .shadow(color: .black, radius: 4)
                        .padding(.leading, UIScreen.main.bounds.width * 0.025)
                        .padding(.bottom, 50)
                    
                    VStack(alignment: .leading) {
                        Text(removeHtmlTag(text: card.flavorText))
                            .font(.system(size: 16))
                            .foregroundColor(.textGray)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom, 20)
                        
                        Group {
                            SubText(header: "type", text: card.getCardTypeName())
                            
                            if card.getMinionTypeName() != "N/A" {
                                SubText(header: "minion-type", text: card.getMinionTypeName())
                            }
                            
                            if card.getSpellSchoolName() != "N/A" {
                                SubText(header: "spell-school-type", text: card.getSpellSchoolName())
                            }
                            
                            SubText(header: "rarity", text: card.getGrade())
                            
                            SubText(header: "set", text: card.getCardSetName())
                            
                            if card.multiClassIds.isEmpty {
                                SubText(header: "class", text: card.getClassName(classId: card.classId))
                            } else {
                                ExtendedSubText(header: "class", textArr: card.getMultiClassName())
                            }
                            
                            if card.getGrade() != "무료" {
                                SubText(header: "cost-to-craft", text: card.getCraftCost())
                                
                                SubText(header: "disenchanting-yield", text: card.getDisenchantingYield())
                            }
                            
                            SubText(header: "artist", text: card.artistName ?? "N/A")
                            
                            Text(card.collectible == 1 ? "collectible" : "not-collectible")
                                .foregroundColor(.textLightOrange)
                                .font(.system(size: 15))
                                .padding(.bottom, 1)
                        }
                        
                        if let _ = card.keywordIds {
                            Text("learn-more")
                                .font(.system(size: 15))
                                .foregroundColor(.textWhite)
                                .padding(.top, 10)
                                .padding(.bottom, 1)

                            ForEach(card.getKeywordNameAndDescriptions(), id: \.self) { keywordNameAndDescription in
                                Text(LocalizedStringKey(keywordNameAndDescription[0]))
                                    .font(.system(size: 15))
                                    .foregroundColor(.textWhite)
                                    .underline()
                                    .padding(.bottom, 1)
                                    .onLongPressGesture(minimumDuration: 1000, pressing: { pressing in
                                        selectedKeywordNameAndDescription = keywordNameAndDescription
                                        isKeywordPressing = pressing
                                    }, perform: {})
                            }
                        }

                        if !childCardManager.childCards.isEmpty {
                            Text("related-cards")
                                .font(.system(size: 15))
                                .foregroundColor(.textWhite)
                                .padding(.top, 10)
                                .padding(.bottom, 1)

                            ForEach(childCardManager.childCards) { childCard in

                                // childIds는 있지만, API상에서 실제로 검색해보면 나타나지 않는 childId가 있음
                                // 확인 후 수정필요
                                if childCard.name != "" {
                                    Text(childCard.name)
                                        .font(.system(size: 15))
                                        .foregroundColor(.textWhite)
                                        .underline()
                                        .padding(.bottom, 1)
                                        .onLongPressGesture(minimumDuration: 1000, pressing: { pressing in
                                            childCardManager.selectedChildCard = childCard
                                            isChildCardPressing = pressing
                                        }, perform: {})
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 15)
                }
                .frame(width: UIScreen.main.bounds.size.width)
                .padding(.vertical, 30)
            }
            
            if isKeywordPressing {
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        KeywordView(keywordName: selectedKeywordNameAndDescription[0], description: selectedKeywordNameAndDescription[1])
                            .padding(.all, 15)
                    }
                }
            }
            
            if isChildCardPressing {
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        KFImage(URL(string: childCardManager.selectedChildCard.image))
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.5)
                            .shadow(color: .black, radius: 4)
                            .padding(.bottom, 10)
                    }
                }
            }
        }
        .onAppear {
            childCardManager.getChildCards(card: card)
        }
        .onTapGesture {
            isCardClicked.toggle()
        }
    }    
}

struct DetailCardView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCardView(card: Card.empty, isCardClicked: .constant(true))
    }
}
