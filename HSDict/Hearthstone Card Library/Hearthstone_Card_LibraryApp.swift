//
//  Hearthstone_Card_LibraryApp.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/04/30.
//

import SwiftUI

@main
struct Hearthstone_Card_LibraryApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .onAppear {
                    UIApplication.shared.addAnyGestureRecognizer()
                }
        }
    }
}

// MARK: - Hiding Keyboard
// https://stackoverflow.com/questions/56491386/how-to-hide-keyboard-when-using-swiftui

class AnyGestureRecognizer: UIGestureRecognizer {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        if let touchedView = touches.first?.view, touchedView is UIControl {
            state = .cancelled
        } else if let touchedView = touches.first?.view as? UITextView, touchedView.isEditable {
            state = .cancelled
        } else {
            state = .began
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       state = .ended
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        state = .cancelled
    }
}

extension UIApplication {
    func addAnyGestureRecognizer() {
        guard let window = windows.first else { return }
        let anyGesture = AnyGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        anyGesture.requiresExclusiveTouchType = false
        anyGesture.cancelsTouchesInView = false
        anyGesture.delegate = self
        window.addGestureRecognizer(anyGesture)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true // set to `false` if you don't want to detect tap during other gestures
    }
}
