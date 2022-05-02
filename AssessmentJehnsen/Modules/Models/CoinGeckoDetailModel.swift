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
    let marketCapUSD: Float?
    let marketCapIDR: Float?
    
    enum Keys: String, CodingKey {
        case marketCapUSD = "usd"
        case marketCapIDR = "idr"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.marketCapUSD = try container.decodeIfPresent(Float.self, forKey: .marketCapUSD)
        self.marketCapIDR = try container.decodeIfPresent(Float.self, forKey: .marketCapIDR)
    }
}

struct CoinMarketData: Decodable {
    let currentPrice: CoinCurrentPrice?
    let coinMarketCap: CoinMarketCap?
    let priceChange24h: Float?
    let priceChange7d: Float?
    let priceChange30d: Float?
    let priceChange1y: Float?
    
    enum Keys: String, CodingKey {
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case priceChange24h = "price_change_percentage_24h"
        case priceChange7d = "price_change_percentage_7d"
        case priceChange30d = "price_change_percentage_30d"
        case priceChange1y = "price_change_percentage_1y"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.currentPrice = try container.decodeIfPresent(CoinCurrentPrice.self, forKey: .currentPrice)
        self.coinMarketCap = try container.decodeIfPresent(CoinMarketCap.self, forKey: .marketCap)
        self.priceChange24h = try container.decodeIfPresent(Float.self, forKey: .priceChange24h)
        self.priceChange7d = try container.decodeIfPresent(Float.self, forKey: .priceChange7d)
        self.priceChange30d = try container.decodeIfPresent(Float.self, forKey: .priceChange30d)
        self.priceChange1y = try container.decodeIfPresent(Float.self, forKey: .priceChange1y)
    }
}

struct CoinCurrentPrice: Decodable {
    let usd: Float?
    let idr: Float?
    
    enum Keys: String, CodingKey {
        case usd
        case idr
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.usd = try container.decodeIfPresent(Float.self, forKey: .usd)
        self.idr = try container.decodeIfPresent(Float.self, forKey: .idr)
    }
}

struct CoinDescription: Decodable {
    let en: String?
    let id: String?
    
    enum Keys: String, CodingKey {
        case en
        case id
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.en = try container.decodeIfPresent(String.self, forKey: .en)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
    }
}

struct CoinGeckoDetailModel: Decodable {
    let idLabel: String?
    let symbolLabel: String?
    let name: String?
    let iconUrl: CoinImage?
    let marketCapRank: Int?
    let marketData: CoinMarketData?
    let description: CoinDescription?
    
    enum Keys: String, CodingKey {
        case idLabel = "id"
        case symbolLabel = "symbol"
        case name = "name"
        case iconUrl = "image"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case marketData = "market_data"
        case description
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.idLabel = try container.decodeIfPresent(String.self, forKey: .idLabel)
        self.symbolLabel = try container.decodeIfPresent(String.self, forKey: .symbolLabel)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.iconUrl = try container.decodeIfPresent(CoinImage.self, forKey: .iconUrl)
        self.marketCapRank = try container.decodeIfPresent(Int.self, forKey: .marketCapRank)
        self.marketData = try container.decodeIfPresent(CoinMarketData.self, forKey: .marketData)
        self.description = try container.decodeIfPresent(CoinDescription.self, forKey: .description)
    }
}
