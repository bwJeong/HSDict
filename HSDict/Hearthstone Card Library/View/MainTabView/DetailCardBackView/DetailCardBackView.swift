//
//  DetailCardBackView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/06.
//

import SwiftUI
import Kingfisher

struct DetailCardBackView: View {
    let cardBack: CardBack
    
    @Binding var isCardBackClicked: Bool
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.8)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    KFImage(URL(string: cardBack.image))
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.width * 0.85)
                        .shadow(color: .black, radius: 4)
                        .padding(.bottom, 50)
                    
                    VStack(alignment: .leading) {
                        Text(cardBack.name)
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        
                        Text(removeHtmlTag(text: cardBack.text))
                            .foregroundColor(.white)
                            .padding(.bottom, 1)
                        
                        SubText(header: "card-back-type", text: cardBack.getSortCategoryName())
                    }
                    .padding(.horizontal, 15)
                }
                .frame(width: UIScreen.main.bounds.size.width)
                .padding(.vertical, 30)
            }
        }
        .onTapGesture {
            isCardBackClicked.toggle()
        }
    }

}

struct DetailCardBackView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCardBackView(cardBack: CardBack.empty, isCardBackClicked: .constant(true))
    }
}
