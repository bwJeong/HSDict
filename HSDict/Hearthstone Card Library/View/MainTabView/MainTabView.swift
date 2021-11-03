//
//  MainTabView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/04.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var networkStatusMonitor = NetworkStatusMonitor()
    
    @ObservedObject var cardManager = CardManager()
    @ObservedObject var cardBackManager = CardBackManager()
    
    @State var selectedTab = 1
    @State var isCardClicked: Bool = false
    @State var isCardBackClicked: Bool = false
    @State var showingAlert: Bool = false
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color.barBackgroundColor)
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                CardLibraryView(cardManager: cardManager, cardBackManager: cardBackManager, isCardClicked: $isCardClicked, isCardBackClicked: $isCardBackClicked)
                    .tabItem {
                        Image(systemName: selectedTab == 1 ? "books.vertical.fill" : "books.vertical")
                        Text("tab-1-title")
                    }
                    .tag(1)
                
                SettingView()
                    .tabItem {
                        Image(systemName: selectedTab == 2 ? "gearshape.fill" : "gearshape")
                        Text("tab-2-title")
                    }
                    .tag(2)
            }
            .accentColor(Color.tabViewAccentColor)
            
            if isCardClicked {
                DetailCardView(card: cardManager.selectedCard, isCardClicked: $isCardClicked)
            }
            
            if isCardBackClicked {
                DetailCardBackView(cardBack: cardBackManager.selectedCardBack, isCardBackClicked: $isCardBackClicked)
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("network-failure"), dismissButton: .default(Text("close-button-title")))
        }
        .onChange(of: networkStatusMonitor.status) { _ in
            if networkStatusMonitor.status == .disconnected {
                showingAlert = true
            } else {
                showingAlert = false
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
