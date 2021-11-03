//
//  StrokeText.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/05.
//

import SwiftUI

struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color
    
    var body: some View {
        ZStack {
            ZStack {
                Text(LocalizedStringKey(text)).offset(x: width, y: width)
                Text(LocalizedStringKey(text)).offset(x: -width, y: -width)
                Text(LocalizedStringKey(text)).offset(x: -width, y: width)
                Text(LocalizedStringKey(text)).offset(x: width, y: -width)
            }
            .foregroundColor(color)
            
            Text(LocalizedStringKey(text))
        }
    }
}
