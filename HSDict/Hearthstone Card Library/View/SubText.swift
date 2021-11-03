//
//  SubText.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/06.
//

import SwiftUI

struct SubText: View {
    let header: String
    let text: String
    
    var body: some View {
        HStack {
            Text(LocalizedStringKey(header))
                .foregroundColor(.textLightOrange)
                .font(.system(size: 15))
                .lineLimit(1)
                .truncationMode(.middle)
            
            Text(LocalizedStringKey(text))
                .foregroundColor(.textWhite)
                .font(.system(size: 15))
                .lineLimit(1)
            
            Spacer()
        }
        .padding(.bottom, 1)
    }
}

struct ExtendedSubText: View {
    let header: String
    let textArr: [String]
    
    var body: some View {
        HStack {
            Text(LocalizedStringKey(header))
                .foregroundColor(.textLightOrange)
                .font(.system(size: 15))
                .lineLimit(1)
                .truncationMode(.middle)
            
            ForEach(0 ..< textArr.count, id: \.self) { index in
                Text(LocalizedStringKey(textArr[index]))
                    .foregroundColor(.textWhite)
                    .font(.system(size: 15))
                    .lineLimit(1)
                
                if index < textArr.count - 1 {
                    Text("/")
                        .foregroundColor(.textWhite)
                        .font(.system(size: 15))
                }
            }
            
            Spacer()
        }
        .padding(.bottom, 1)
    }
    
}
