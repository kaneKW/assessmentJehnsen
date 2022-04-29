//
//  NetworkingEndpoint.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 22/04/22.
//

import Foundation

enum NetworkingMethod: String {
    case get, post, patch, put, delete
}

public enum NetworkingEndpoint {

    // Login
    case getCoinMarkets
    case getCoinDetails(coinId: String)

    var value: String {
        switch self {
        case .getCoinMarkets: return "/api/v3/coins/markets"
        case .getCoinDetails(let coinId): return "/api/v3/coins/\(coinId)"
        }
    }
}
