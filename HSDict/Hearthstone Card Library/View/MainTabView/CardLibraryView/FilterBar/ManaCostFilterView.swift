//
//  ManaCostFilterView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/06.
//

import SwiftUI

struct ManaCostFilterView: View {
    @ObservedObject var cardManager: CardManager
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.main.bounds.width - 8, height: 30)
                .foregroundColor(.filterBarBackgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.filterBarButtonBoderColor, lineWidth: 2)
                )
                .shadow(color: .black, radius: 3, y: 2)
            
            HStack {
                ForEach(0 ... 10, id: \.self) { cost in
                    ManaCostButton(cost: cost, cardManager: cardManager)
                    
                    if cost >= 0 && cost < 10 {
                        Spacer()
                    }
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

fileprivate struct ManaCostButton: View {
    let cost: Int
    
    @ObservedObject var cardManager: CardManager
    
    var body: some View {
        ZStack {
            Image("Mana_crystal")
                .resizable()
                .frame(width: 18, height: 18)
                .brightness(cardManager.manaCostCheckArr[cost] ? 0.4: 0)
                .shadow(color: .black, radius: 1)
            
            StrokeText(text: "\(cost == 10 ? "10+" : String(cost))", width: 1, color: .black)
                .foregroundColor(.textWhite)
                .font(.system(size: 12, weight: .bold))
        }
        .onTapGesture {
            cardManager.toggleManaCostCheckArr(selectedCost: cost)
        }
    }
}

struct ManaCostFilterView_Previews: PreviewProvider {
    static var previews: some View {
        ManaCostFilterView(cardManager: CardManager())
    }
}
