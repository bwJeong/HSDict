//
//  KeywordView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/05.
//

import SwiftUI

struct KeywordView: View {
    let keywordName: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            StrokeText(text: keywordName, width: 1, color: .black)
                .foregroundColor(.textWhite)
                .font(.system(size: 16, weight: .bold))
                .padding(.bottom, 1)
            
            Text(LocalizedStringKey(description))
                .foregroundColor(.textWhite)
                .font(.system(size: 15))
        }
        .frame(width: 150)
        .padding()
        .background(Color.keywordViewBackgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.keywordViewBorderColor, lineWidth: 5)
        )
        .shadow(radius: 3)
        
    }
}

struct KeywordView_Previews: PreviewProvider {
    static var previews: some View {
        KeywordView(keywordName: "도발", description: "적은 도발 능력이 있는 하수인을 먼저 공격해야 합니다.")
    }
}
