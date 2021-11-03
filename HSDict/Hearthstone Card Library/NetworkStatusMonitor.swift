//
//  NetworkStatusMonitor.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/13.
//

import Foundation
import Network

// MARK: - 네트워크 상태 모니터링
// https://stackoverflow.com/questions/65816559/using-reachability-library-to-swiftui-based-app-to-notify-when-network-is-lost

enum NetworkStatus: String {
    case connected
    case disconnected
}

class NetworkStatusMonitor: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "Monitor")
    
    @Published var status: NetworkStatus = .connected
    
    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }

            DispatchQueue.main.async {
                if path.status == .satisfied {
                    self.status = .connected
                } else {
                    self.status = .disconnected
                }
            }
        }
        
        monitor.start(queue: queue)
    }
}
