//
//  CoinGeckoModel.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 22/04/22.
//

import Foundation

enum CoinOrder: String {
    case market_cap_desc, gecko_desc, gecko_asc, market_cap_asc, volume_asc, volume_desc, id_asc, id_desc
}

struct CoinGeckoModel: Decodable{
    let idLabel: String?
    let symbolLabel: String?
    let name: String?
    let iconUrl: String?
    let currentPrice: Float?
    let priceChange24h: Float?
    
    enum Keys: String, CodingKey {
        case idLabel = "id"
        case symbolLabel = "symbol"
        case name = "name"
        case iconUrl = "image"
        case currentPrice = "current_price"
        case priceChange24h = "price_change_percentage_24h"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.idLabel = try container.decodeIfPresent(String.self, forKey: .idLabel)
        self.symbolLabel = try container.decodeIfPresent(String.self, forKey: .symbolLabel)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.iconUrl = try container.decodeIfPresent(String.self, forKey: .iconUrl)
        self.currentPrice = try container.decodeIfPresent(Float.self, forKey: .currentPrice)
        self.priceChange24h = try container.decodeIfPresent(Float.self, forKey: .priceChange24h)
    }
}
