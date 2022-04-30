//
//  UserDefaultManager.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 01/05/22.
//

import Foundation

class UserDefaultManager {
    static let shared = UserDefaultManager()
    
    let userDefaults = UserDefaults.standard
    
    let keyOrder = "fetchOrder"
    
    func saveFetchOrder(order: CoinOrder) {
        userDefaults.set(order.rawValue, forKey: keyOrder)
    }
    
    func getFetchOrder() -> CoinOrder {
        guard let orderRawValue = userDefaults.string(forKey: keyOrder) else {
            return .market_cap_desc
        }
        return CoinOrder(rawValue: orderRawValue) ?? .market_cap_desc
    }
}
