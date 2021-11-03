//
//  SettingView.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/10.
//

import SwiftUI
import MessageUI

struct SettingView: View {
    @State var isSendFeedbackClicked: Bool = false
    @State var isBugReportClicked: Bool = false
    @State var result: Result<MFMailComposeResult, Error>? = nil
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(Color.barBackgroundColor)
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                Color.cardLibraryViewBackgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    
                    // MARK: - 피드백 전달하기
                    Button(action: {
                        if MFMailComposeViewController.canSendMail() {
                            isSendFeedbackClicked.toggle()
                        }
                    }, label: {
                        SettingButton(imageSystemName: "envelope.fill", imageColor: Color.white, title: "feedback-button-title")
                    })
                    .sheet(isPresented: $isSendFeedbackClicked, content: {
                        MailView(isShowing: $isSendFeedbackClicked, result: $result, subject: "Feedback for HSDict", recipients: ["bwjeong93@gmail.com"])
                    })
                    
                    // MARK: - 버그 리포트
                    Button(action: {
                        if MFMailComposeViewController.canSendMail() {
                            isBugReportClicked.toggle()
                        }
                    }, label: {
                        SettingButton(imageSystemName: "exclamationmark.bubble.fill", imageColor: .red, title: "bug-report-button-title")
                    })
                    .sheet(isPresented: $isBugReportClicked, content: {
                        MailView(isShowing: $isBugReportClicked, result: $result, subject: "Bug report for HSDict", recipients: ["bwjeong93@gmail.com"])
                    })
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.top, 10)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("setting-navigation-title")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
            }
        }
    }}

fileprivate struct SettingButton: View {
    let imageSystemName: String
    let imageColor: Color
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: imageSystemName)
                .frame(width: 30, height: 20)
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(imageColor)
            
            Text(LocalizedStringKey(title))
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.textWhite)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .frame(width: 20, height: 20)
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.itemYellow)

        }
        .padding(.all, 8)
        .background(Color.filterBarBackgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
