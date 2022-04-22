//
//  HomeViewModel.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 22/04/22.
//

import Foundation

class HomeViewModel {
    let service: CoinServiceProtocol
    var coinData = [CoinGeckoModel]()
    var fetchOrder: CoinOrder = .market_cap_desc
    var currencyInUSD: Bool = true
    var page = 1
    
    var onFinishFetchCoin: ((_ message: String?) -> Void)?
    
    init(service: CoinServiceProtocol) {
        self.service = service
    }
    
    func fetchCoins() {
        service.fetchCoins(order: fetchOrder, currencyInUSD: currencyInUSD, page: page) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                if self.page == 0 {
                    self.coinData = response
                } else {
                    self.coinData += response
                }
                self.page += 1
                self.onFinishFetchCoin?(nil)
            case .failure(let error):
                self.onFinishFetchCoin?(error.localizedDescription)
            }
        }
    }
}
