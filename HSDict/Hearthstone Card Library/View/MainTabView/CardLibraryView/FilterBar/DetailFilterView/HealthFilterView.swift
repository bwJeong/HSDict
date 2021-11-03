//
//  HealthFilterView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/07.
//

import SwiftUI

struct HealthFilterView: View {
    @ObservedObject var cardManager: CardManager
    
    @Binding var isHealthFilterClicked: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.filterViewBackgroundColor)
                .shadow(color: .black, radius: 3, y: 2)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("any-health")
                        .frame(width: 100, alignment: .leading)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.textYellow)
                        .padding(.vertical, 2)
                        .onTapGesture {
                            cardManager.setHealth(health: "")
                            isHealthFilterClicked.toggle()
                        }
                    
                    ForEach(0 ... 10, id: \.self) { health in
                        Text(health == 10 ? "health: \("10+")" : "health: \(String(health))")
                            .frame(width: 100, alignment: .leading)
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.textWhite)
                            .padding(.vertical, 2)
                            .onTapGesture {
                                cardManager.setHealth(health: String(health))
                                isHealthFilterClicked.toggle()
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

struct HealthFilterView_Previews: PreviewProvider {
    static var previews: some View {
        HealthFilterView(cardManager: CardManager(), isHealthFilterClicked: .constant(true))
    }
}
