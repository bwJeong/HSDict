//
//  OAuth.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/09/14.
//

import Foundation

struct OAuth: Codable {
    let accessToken: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
}
