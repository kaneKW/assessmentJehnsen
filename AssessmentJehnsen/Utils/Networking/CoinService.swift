//
//  CoinService.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 22/04/22.
//

import Foundation

protocol CoinServiceProtocol {
    func fetchCoins(order: CoinOrder, currencyInUSD: Bool, page: Int, completion: @escaping (Result<[CoinGeckoModel], CoinGeckoError>) -> Void)
    func fetchCoinDetail(coinId: String, completion: @escaping (Result<CoinGeckoDetailModel, CoinGeckoError>) -> Void)
}

class CoinService: CoinServiceProtocol {
    func fetchCoins(order: CoinOrder, currencyInUSD: Bool, page: Int = 1, completion: @escaping (Result<[CoinGeckoModel], CoinGeckoError>) -> Void) {
        let currency = currencyInUSD ? "usd" : "idr"
        let parameters: [String: Any] = [
            "vs_currency": currency,
            "order": order.rawValue,
            "per_page": "15",
            "page": "\(page)",
            "sparkline": "false",
        ]
        NetworkingService.shared.request(.get, .getCoinMarkets, headers: [:], parameters: parameters, responseType: [CoinGeckoModel].self) { result in
            completion(result)
        }
    }
    
    func fetchCoinDetail(coinId: String, completion: @escaping (Result<CoinGeckoDetailModel, CoinGeckoError>) -> Void) {
        NetworkingService.shared.request(.get, .getCoinDetails(coinId: coinId), headers: [:], parameters: [:], responseType: CoinGeckoDetailModel.self) { result in
            completion(result)
        }
    }
}


