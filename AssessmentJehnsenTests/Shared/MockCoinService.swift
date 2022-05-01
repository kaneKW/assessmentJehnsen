//
//  MockCoinService.swift
//  AssessmentJehnsenTests
//
//  Created by Jehnsen Hirena Kane on 02/05/22.
//

import Foundation
@testable import AssessmentJehnsen

class MockCoinService: CoinServiceProtocol {
    var response: Any?
    
    func fetchCoins(order: CoinOrder, currencyInUSD: Bool, page: Int, completion: @escaping (Result<[CoinGeckoModel], CoinGeckoError>) -> Void) {
        if let json = response {
            let response = try! JSONDecoder().decode([CoinGeckoModel].self, withJSONObject: json)
            completion(.success(response))
        } else {
            completion(.failure(.serializationError))
        }
    }
    
    func fetchCoinDetail(coinId: String, completion: @escaping (Result<CoinGeckoDetailModel, CoinGeckoError>) -> Void) {
        if let json = response {
            let response = try! JSONDecoder().decode(CoinGeckoDetailModel.self, withJSONObject: json)
            completion(.success(response))
        } else {
            completion(.failure(.serializationError))
        }
    }
}
