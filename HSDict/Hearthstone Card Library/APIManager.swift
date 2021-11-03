//
//  APIManager.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/03.
//

import Foundation
import Alamofire

struct APIManager {
    // Region (Global): US, EU, APAC
    private let globalTokenURI = "https://apac.battle.net/oauth/token"
    
    // Region (China): CN
    private let chinaTokenURI = "https://www.battlenet.com.cn/oauth/token"
    
    private func getAccessToken(_ completion: @escaping (String) -> Void) {
        var params: [String : String] = [:]
        
        params["client_id"] = Client.id
        params["client_secret"] = Client.secret
        params["grant_type"] = "client_credentials"
        
        AF.request(Locale.current.regionCode == "CN" ? chinaTokenURI : globalTokenURI, method: .post, parameters: params)
            .responseJSON { response in
                switch response.result {
                case .success(let obj):
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                        let oAuth = try JSONDecoder().decode(OAuth.self, from: jsonData)
                        
                        completion(oAuth.accessToken)
                    } catch {
                        print(String(describing: error))
                    }
                case .failure(let afError):
                    print(afError)
                }
            }
    }
    
    func getCards(uri: String, completion: @escaping (Cards) -> Void) {
        getAccessToken { accessToken in
            let uri = uri + "&access_token=\(accessToken)"
            
            AF.request(uri.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
                .responseJSON { response in
                    switch response.result {
                    case .success(let obj):
                        do {
                            let jsonData = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                            let cards = try JSONDecoder().decode(Cards.self, from: jsonData)
                            
                            completion(cards)
                        } catch {
                            print(String(describing: error))
                        }
                    case .failure(let afError):
                        print(afError)
                    }
                }
        }
    }
    
    func getChildCard(uri: String, completion: @escaping (ChildCard) -> Void) {
        getAccessToken { accessToken in
            let uri = uri + "&access_token=\(accessToken)"
            
            AF.request(uri.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
                .responseJSON { response in
                    switch response.result {
                    case .success(let obj):
                        do {
                            let jsonData = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                            let childCard = try JSONDecoder().decode(ChildCard.self, from: jsonData)
                            
                            completion(childCard)
                        } catch {
                            print(String(describing: error))
                        }
                    case .failure(let afError):
                        print(afError)
                    }
                }
        }
    }
    
    func getCardBacks(uri: String, completion: @escaping (CardBacks) -> Void) {
        getAccessToken { accessToken in
            let uri = uri + "&access_token=\(accessToken)"
            
            AF.request(uri.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
                .responseJSON { response in
                    switch response.result {
                    case .success(let obj):
                        do {
                            let jsonData = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                            let cardBacks = try JSONDecoder().decode(CardBacks.self, from: jsonData)
                            
                            completion(cardBacks)
                        } catch {
                            print(String(describing: error))
                        }
                    case .failure(let afError):
                        print(afError)
                    }
                }
        }
    }
}
