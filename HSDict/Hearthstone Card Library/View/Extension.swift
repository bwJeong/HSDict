//
//  Extension.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/04.
//

import SwiftUI
import SwiftSoup

extension View {
    func removeHtmlTag(text: String) -> String {
        let doc: Document = try! SwiftSoup.parse(text)
        let txt = try! doc.text()
        
        return txt
    }
}

extension Color {
    static let barBackgroundColor = Color(#colorLiteral(red: 0.1647058824, green: 0.1254901961, blue: 0.09411764706, alpha: 1))
    static let tabViewAccentColor = Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    static let cardLibraryViewBackgroundColor = Color(#colorLiteral(red: 0.9019607843, green: 0.8196078431, blue: 0.6470588235, alpha: 1))
    static let itemYellow = Color(#colorLiteral(red: 0.9883462787, green: 0.8201676011, blue: 0.2656730413, alpha: 1))
    static let filterBarBackgroundColor = Color(#colorLiteral(red: 0.3183822036, green: 0.0785902217, blue: 0.07034529001, alpha: 1))
    static let filterBarButtonBackgroundColor = Color(#colorLiteral(red: 0.6392210722, green: 0.5806002021, blue: 0.4487408996, alpha: 1))
    static let filterBarButtonBackgroundColorWhenClicked = Color(#colorLiteral(red: 0.9991746545, green: 1, blue: 0.5796211362, alpha: 1))
    static let filterBarButtonBoderColor = Color(#colorLiteral(red: 0.8665356636, green: 0.7729820609, blue: 0.4091835916, alpha: 1))
    static let filterBarButtonBoderColorWhenClicked = Color(#colorLiteral(red: 0.9999126792, green: 1, blue: 0.9998814464, alpha: 1))
    static let filterViewBackgroundColor = Color(#colorLiteral(red: 0.2392756641, green: 0.211823225, blue: 0.1830695271, alpha: 1))
    static let keywordViewBackgroundColor = Color(#colorLiteral(red: 0.3568123877, green: 0.3451707661, blue: 0.3082124293, alpha: 1))
    static let keywordViewBorderColor = Color(#colorLiteral(red: 0.6901151538, green: 0.6902469993, blue: 0.681945622, alpha: 1))
    
    // Text
    static let textDarkBrown = Color(#colorLiteral(red: 0.3807471395, green: 0.2629181147, blue: 0.1508009732, alpha: 1))
    static let textWhite = Color(#colorLiteral(red: 0.9999126792, green: 1, blue: 0.9998814464, alpha: 1))
    static let textGray = Color(#colorLiteral(red: 0.6313390136, green: 0.6235786676, blue: 0.6152876019, alpha: 1))
    static let textBrown = Color(#colorLiteral(red: 0.5887010098, green: 0.4550506473, blue: 0.3892925084, alpha: 1))
    static let textYellow = Color(#colorLiteral(red: 0.9883462787, green: 0.8201676011, blue: 0.2656730413, alpha: 1))
    static let textLightOrange = Color(#colorLiteral(red: 1, green: 0.8983798623, blue: 0.6756170988, alpha: 1))
}
