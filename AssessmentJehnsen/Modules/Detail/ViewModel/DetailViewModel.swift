//
//  DetailViewModel.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 24/04/22.
//

import Foundation

class DetailViewModel {
    let service: CoinServiceProtocol
    let coinId: String
    var coinDetailData: CoinGeckoDetailModel?
    
    var onFinishFetchCoinDetail: ((_ message: String?) -> Void)?
    
    init(service: CoinServiceProtocol, coinId: String) {
        self.service = service
        self.coinId = coinId
    }
    
    func getCoinDetail() {
        service.fetchCoinDetail(coinId: coinId) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.coinDetailData = response
                self.onFinishFetchCoinDetail?(nil)
            case .failure(let error):
                self.onFinishFetchCoinDetail?(error.localizedDescription)
            }
        }
    }
}
