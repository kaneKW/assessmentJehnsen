//
//  CoinGeckoDetailModel.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 24/04/22.
//

import Foundation

struct CoinImage: Decodable {
    let largeImage: String?
    
    enum Keys: String, CodingKey {
        case large
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.largeImage = try container.decodeIfPresent(String.self, forKey: .large)
    }
}

struct CoinMarketCap: Decodable {
    let marketCapUSD: String?
    
    enum Keys: String, CodingKey {
        case marketCapUSD = "usd"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.marketCapUSD = try container.decodeIfPresent(String.self, forKey: .marketCapUSD)
    }
}

struct CoinMarketData: Decodable {
    let currentPrice: CoinCurrentPrice?
    
    enum Keys: String, CodingKey {
        case currentPrice = "current_price"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.currentPrice = try container.decodeIfPresent(CoinCurrentPrice.self, forKey: .currentPrice)
    }
}

struct CoinCurrentPrice: Decodable {
    let usd: String?
    
    enum Keys: String, CodingKey {
        case usd
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.usd = try container.decodeIfPresent(String.self, forKey: .usd)
    }
}

struct CoinDescription: Decodable {
    let en: String?
    
    enum Keys: String, CodingKey {
        case en
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.en = try container.decodeIfPresent(String.self, forKey: .en)
    }
}

struct CoinGeckoDetailModel: Decodable {
    let idLabel: String?
    let symbolLabel: String?
    let name: String?
    let iconUrl: CoinImage?
    let marketCap: CoinMarketCap?
    let marketCapRank: Int?
    let marketData: CoinMarketData?
    let description: CoinDescription?
    let priceChange24h: Float?
    let priceChange7d: Float?
    let priceChange30d: Float?
    let priceChange1y: Float?
    
    enum Keys: String, CodingKey {
        case idLabel = "id"
        case symbolLabel = "symbol"
        case name = "name"
        case iconUrl = "image"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case marketData = "market_data"
        case description
        case priceChange24h = "price_change_percentage_24h"
        case priceChange7d = "price_change_percentage_7d"
        case priceChange30d = "price_change_percentage_30d"
        case priceChange1y = "price_change_percentage_1y"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.idLabel = try container.decodeIfPresent(String.self, forKey: .idLabel)
        self.symbolLabel = try container.decodeIfPresent(String.self, forKey: .symbolLabel)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.iconUrl = try container.decodeIfPresent(CoinImage.self, forKey: .iconUrl)
        self.marketCap = try container.decodeIfPresent(CoinMarketCap.self, forKey: .marketCap)
        self.marketCapRank = try container.decodeIfPresent(Int.self, forKey: .marketCapRank)
        self.marketData = try container.decodeIfPresent(CoinMarketData.self, forKey: .marketData)
        self.description = try container.decodeIfPresent(CoinDescription.self, forKey: .description)
        self.priceChange24h = try container.decodeIfPresent(Float.self, forKey: .priceChange24h)
        self.priceChange7d = try container.decodeIfPresent(Float.self, forKey: .priceChange7d)
        self.priceChange30d = try container.decodeIfPresent(Float.self, forKey: .priceChange30d)
        self.priceChange1y = try container.decodeIfPresent(Float.self, forKey: .priceChange1y)
    }
}
