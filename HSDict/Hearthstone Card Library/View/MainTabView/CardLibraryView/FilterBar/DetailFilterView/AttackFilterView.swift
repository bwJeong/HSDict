//
//  AttackFilterView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/07.
//

import SwiftUI

struct AttackFilterView: View {
    @ObservedObject var cardManager: CardManager
    
    @Binding var isAttackFilterClicked: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.filterViewBackgroundColor)
                .shadow(color: .black, radius: 3, y: 2)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("any-attack")
                        .frame(width: 100, alignment: .leading)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.textYellow)
                        .padding(.vertical, 2)
                        .onTapGesture {
                            cardManager.setAttack(attack: "")
                            isAttackFilterClicked.toggle()
                        }
                    
                    ForEach(0 ... 10, id: \.self) { attack in
                        Text(attack == 10 ? "attack: \("10+")" : "attack: \(String(attack))")
                            .frame(width: 100, alignment: .leading)
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.textWhite)
                            .padding(.vertical, 2)
                            .onTapGesture {
                                cardManager.setAttack(attack: String(attack))
                                isAttackFilterClicked.toggle()
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

struct AttackFilterView_Previews: PreviewProvider {
    static var previews: some View {
        AttackFilterView(cardManager: CardManager(), isAttackFilterClicked: .constant(true))
    }
}
