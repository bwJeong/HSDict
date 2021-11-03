//
//  FilterBar.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/06.
//

import SwiftUI

struct FilterBar: View {
    @ObservedObject var cardManager: CardManager
    
    @State var isCardSetFilterClicked: Bool = false
    @State var isClassFilterClicked: Bool = false
    @State var isManaCostFilterClicked: Bool = false
    @State var isSearchFilterClicked: Bool = false
    @State var isDetailFilterClicked: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: UIScreen.main.bounds.width - 5, height: 35)
                    .foregroundColor(.filterBarBackgroundColor)
                    .shadow(color: .black, radius: 3, y: 2)
                
                HStack {
                    CardSetFilterButton(cardSetName: cardManager.cardSetInfo, isCardSetFilterClicked: $isCardSetFilterClicked)
                    
                    ClassFilterButton(className: cardManager.classInfo, isClassFilterClicked: $isClassFilterClicked)
                    
                    Spacer()
                    
                    ManaCostFilterButton(isManaCostFilterClicked: $isManaCostFilterClicked)
                    
                    SearchFilterButton(isFindFilterClicked: $isSearchFilterClicked)
                    
                    DetailFilterButton(isDetailFilterClicked: $isDetailFilterClicked)
                }
                .frame(width: UIScreen.main.bounds.width - 15)
            }
            
            if isCardSetFilterClicked {
                HStack {
                    CardSetFilterView(cardManager: cardManager, isCardSetFilterClicked: $isCardSetFilterClicked)
                        .offset(x: 8, y: 40)
                    
                    Spacer()
                }
            }
            
            if isClassFilterClicked {
                HStack {
                    ClassFilterView(cardManager: cardManager, isClassFilterClicked: $isClassFilterClicked)
                        .offset(x: UIScreen.main.bounds.width * 0.15 + 45 + 8, y: 40)
                    
                    Spacer()
                }
            }
            
            if isManaCostFilterClicked {
                ManaCostFilterView(cardManager: cardManager)
                    .offset(y: 40)
            }
            
            HStack {
                Spacer()
                
                SearchFilterView(cardManager: cardManager)
                    .offset(y: 40)
            }
            .offset(y: isSearchFilterClicked ? 0 : UIScreen.main.bounds.height)
            
            if isDetailFilterClicked {
                HStack {
                    Spacer()
                    
                    DetailFilterView(cardManager: cardManager)
                        .offset(y: 40)
                }
            }
        }
        .onChange(of: isCardSetFilterClicked) { _ in
            if isCardSetFilterClicked {
                isClassFilterClicked = false
                isManaCostFilterClicked = false
                isSearchFilterClicked = false
                isDetailFilterClicked = false
            }
        }
        .onChange(of: isClassFilterClicked) { _ in
            if isClassFilterClicked {
                isCardSetFilterClicked = false
                isManaCostFilterClicked = false
                isSearchFilterClicked = false
                isDetailFilterClicked = false
            }
        }
        .onChange(of: isManaCostFilterClicked) { _ in
            if isManaCostFilterClicked {
                isCardSetFilterClicked = false
                isClassFilterClicked = false
                isSearchFilterClicked = false
                isDetailFilterClicked = false
            }
        }
        .onChange(of: isSearchFilterClicked) { _ in
            if isSearchFilterClicked {
                isCardSetFilterClicked = false
                isClassFilterClicked = false
                isManaCostFilterClicked = false
                isDetailFilterClicked = false
            }
        }
        .onChange(of: isDetailFilterClicked) { _ in
            if isDetailFilterClicked {
                isCardSetFilterClicked = false
                isClassFilterClicked = false
                isManaCostFilterClicked = false
                isSearchFilterClicked = false
            }
        }
    }
}

fileprivate struct CardSetFilterButton: View {
    let cardSetName: String
    
    @Binding var isCardSetFilterClicked: Bool
    
    var body: some View {
        HStack {
            Text(LocalizedStringKey(cardSetName))
                .frame(width: UIScreen.main.bounds.width * 0.15, height: 25, alignment: .leading)
                .foregroundColor(.textDarkBrown)
                .font(.system(size: 10, weight: .bold))
                .lineLimit(1)
                .padding(.leading, 10)
            
            Image(systemName: isCardSetFilterClicked ? "chevron.up" : "chevron.down")
                .frame(width: 10, height: 25)
                .foregroundColor(.textDarkBrown)
                .font(.system(size: 10))
                .padding(.trailing, 10)
        }
        .background(isCardSetFilterClicked ? Color.filterBarButtonBackgroundColorWhenClicked : Color.filterBarButtonBackgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 40))
        .overlay(
            RoundedRectangle(cornerRadius: 40.0)
                .stroke(isCardSetFilterClicked ? Color.filterBarButtonBoderColorWhenClicked : Color.filterBarButtonBoderColor, lineWidth: 2)
        )
        .shadow(radius: 3)
        .onTapGesture {
            isCardSetFilterClicked.toggle()
        }
    }
}

fileprivate struct ClassFilterButton: View {
    let className: String
    
    @Binding var isClassFilterClicked: Bool
    
    var body: some View {
        HStack {
            Text(LocalizedStringKey(className))
                .frame(height: 25, alignment: .leading)
                .foregroundColor(.textDarkBrown)
                .font(.system(size: 10, weight: .bold))
                .lineLimit(1)
                .padding(.leading, 10)
            
            Image(systemName: isClassFilterClicked ? "chevron.up" : "chevron.down")
                .frame(width: 10, height: 25)
                .foregroundColor(.textDarkBrown)
                .font(.system(size: 10))
                .padding(.trailing, 10)
        }
        .background(isClassFilterClicked ? Color.filterBarButtonBackgroundColorWhenClicked : Color.filterBarButtonBackgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 40))
        .overlay(
            RoundedRectangle(cornerRadius: 40.0)
                .stroke(isClassFilterClicked ? Color.filterBarButtonBoderColorWhenClicked : Color.filterBarButtonBoderColor, lineWidth: 2)
        )
        .shadow(radius: 3)
        .onTapGesture {
            isClassFilterClicked.toggle()
        }
    }
}

fileprivate struct ManaCostFilterButton: View {
    @Binding var isManaCostFilterClicked: Bool
    
    var body: some View {
        Image("Mana_crystal")
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 25)
            .brightness(isManaCostFilterClicked ? 0.4 : 0)
            .shadow(color: .black, radius: 1)
            .onTapGesture {
                isManaCostFilterClicked.toggle()
            }
    }
}

fileprivate struct SearchFilterButton: View {
    @Binding var isFindFilterClicked: Bool
    
    var body: some View {
        Image(systemName: isFindFilterClicked ? "xmark" : "magnifyingglass")
            .foregroundColor(.itemYellow)
            .font(.system(size: 20))
            .frame(width: 30, height: 25)
            .shadow(color: .black, radius: 1)
            .onTapGesture {
                isFindFilterClicked.toggle()
            }
    }
}

fileprivate struct DetailFilterButton: View {
    @Binding var isDetailFilterClicked: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(.textDarkBrown)
                .font(.system(size: 10))
            
            Text("filter-button-title")
                .foregroundColor(.textDarkBrown)
                .font(.system(size: 10, weight: .bold))
        }
        .frame(width: 60, height: 25)
        .background(isDetailFilterClicked ? Color.filterBarButtonBackgroundColorWhenClicked : Color.filterBarButtonBackgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .overlay(
            RoundedRectangle(cornerRadius: 40.0)
                .stroke(isDetailFilterClicked ? Color.filterBarButtonBoderColorWhenClicked : Color.filterBarButtonBoderColor, lineWidth: 2)
        )
        .shadow(radius: 3)
        .onTapGesture {
            isDetailFilterClicked.toggle()
        }
    }
}

struct FilterBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FilterBar(cardManager: CardManager())
            
            Spacer()
        }
    }
}
