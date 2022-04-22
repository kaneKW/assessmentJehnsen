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

//{
//    "id": "bitcoin",
//    "symbol": "btc",
//    "name": "Bitcoin",
//    "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
//    "current_price": 40454,
//    "market_cap": 769389814341,
//    "market_cap_rank": 1,
//    "fully_diluted_valuation": 849539854153,
//    "total_volume": 32728545509,
//    "high_24h": 42859,
//    "low_24h": 39975,
//    "price_change_24h": -1484.16310112783,
//    "price_change_percentage_24h": -3.53891,
//    "market_cap_change_24h": -27345155117.165527,
//    "market_cap_change_percentage_24h": -3.43215,
//    "circulating_supply": 19018750.0,
//    "total_supply": 21000000.0,
//    "max_supply": 21000000.0,
//    "ath": 69045,
//    "ath_change_percentage": -41.5075,
//    "ath_date": "2021-11-10T14:24:11.849Z",
//    "atl": 67.81,
//    "atl_change_percentage": 59458.48758,
//    "atl_date": "2013-07-06T00:00:00.000Z",
//    "roi": null,
//    "last_updated": "2022-04-22T09:32:16.956Z"
//},
//
//
