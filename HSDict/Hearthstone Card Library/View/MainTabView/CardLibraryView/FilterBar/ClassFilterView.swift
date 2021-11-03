//
//  ClassFilterView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/06.
//

import SwiftUI

struct ClassFilterView: View {
    @ObservedObject var cardManager: CardManager
    
    @Binding var isClassFilterClicked: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.filterViewBackgroundColor)
                .shadow(color: .black, radius: 3, y: 2)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(classInfos.map { $0.1 }, id: \.self) { classInfo in
                        Text(LocalizedStringKey(classInfo))
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.textWhite)
                            .padding(.vertical, 2)
                            .onTapGesture {
                                cardManager.setClassInfo(classInfo: classInfo)
                                isClassFilterClicked.toggle()
                            }
                    }
                }
                .padding(.all, 10)
            }
        }
        .frame(width: 110, height: UIScreen.main.bounds.height * 0.25)
    }
}

struct ClassFilterView_Previews: PreviewProvider {
    static var previews: some View {
        ClassFilterView(cardManager: CardManager(), isClassFilterClicked: .constant(true))
    }
}
