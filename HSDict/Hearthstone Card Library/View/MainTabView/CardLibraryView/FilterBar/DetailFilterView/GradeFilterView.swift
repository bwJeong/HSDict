//
//  GradeFilterView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/07.
//

import SwiftUI

struct GradeFilterView: View {
    @ObservedObject var cardManager: CardManager
    
    @Binding var isGradeFilterClicked: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.filterViewBackgroundColor)
                .shadow(color: .black, radius: 3, y: 2)
            
            VStack(alignment: .leading) {
                Text("any-rarity")
                    .frame(width: 100, alignment: .leading)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.textYellow)
                    .padding(.vertical, 2)
                    .onTapGesture {
                        cardManager.setGradeInfo(gradeInfo: "rarity-button-title")
                        isGradeFilterClicked.toggle()
                    }
                
                ForEach(gradeInfos.map { $0.1 }, id: \.self) { gradeInfo in
                    Text(LocalizedStringKey(gradeInfo))
                        .frame(width: 100, alignment: .leading)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.textWhite)
                        .padding(.vertical, 2)
                        .onTapGesture {
                            cardManager.setGradeInfo(gradeInfo: gradeInfo)
                            isGradeFilterClicked.toggle()
                        }
                }
            }
            .padding(.vertical, 10)
            .padding(.leading, 10)
            
        }
        .frame(width: 100, height: 170)
    }
}

struct GradeFilterView_Previews: PreviewProvider {
    static var previews: some View {
        GradeFilterView(cardManager: CardManager(), isGradeFilterClicked: .constant(true))
    }
}
